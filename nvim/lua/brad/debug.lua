local js_based_languages = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' }

return {
  'rcarriga/nvim-dap-ui',
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local virt = require 'nvim-dap-virtual-text'

    dap.setup()
    dapui.setup()
    virt.setup()

    vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })

    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        -- nodejs
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
        },
        -- nodejs
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
          sourceMaps = true,
        },
        -- web app (client side)
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Launch & Debug Chrome',
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = 'Enter URL: ',
                default = 'http://localhost:3000',
              }, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = '${workspaceFolder}',
          skipFiles = { '<node_internals>/**/*.js' },
          protocol = 'inspector',
          sourceMaps = true,
          userDataDir = false,
        },
        -- launch.json configs
        {
          name = '----- launch.json configs -----',
          type = '',
          request = 'launch',
        },
      }
    end

    -- Eval under cursor
    vim.keymap.set('n', '<leader>?', function()
      dapui.eval(nil, { enter = true })
    end)

    vim.keymap.set('n', '<leader>di', dap.step_into)
    vim.keymap.set('n', '<leader>do', dap.step_over)
    vim.keymap.set('n', '<leader>dO', dap.step_out)
    vim.keymap.set('n', '<leader>db', dap.step_back)
    vim.keymap.set('n', '<leader>dr', dap.restart)

    -- Launch DAP UI upon debug start, close when ending
    local before = dap.listeners.before
    before.attach.dapui_config = function()
      dapui.open()
    end
    before.launch.dapui_config = function()
      dapui.open()
    end
    before.event_terminated.dapui_config = function()
      dapui.close()
    end
    before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {
    { '<leader>db', '<cmd>lua require "dap".toggle_breakpoint()<cr>t', desc = '[D]EBUG Toggle [B]reakpoint' },
    { '<F5>', '<cmd>lua require "dap".continue()<cr>', desc = '[D]EBUG [C]ontinue' },
    { '<leader>dr', '<cmd>lua require "dap".continue()<cr>', desc = '[D]EBUG [R]esume' },
    {
      '<leader>da',
      function()
        if vim.fn.filereadable '.vscode/launch.json' then
          local dap_vscode = require 'dap.ext.vscode'
          dap_vscode.load_launchjs(nil, {
            ['chrome'] = js_based_languages,
            ['node'] = js_based_languages,
            ['pwa-chrome'] = js_based_languages,
            ['pwa-node'] = js_based_languages,
          })
        end
        require('dap').continue()
      end,
      desc = '[D]ebug Run with [A]rgs',
    },
  },
  dependencies = {
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    {
      'mxsdev/nvim-dap-vscode-js',
      config = function()
        require('dap-vscode-js').setup {
          debugger_path = vim.fn.resolve(vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug'),
          adapters = {
            'chrome',
            'node',
            'node-terminal',
            'pwa-chrome',
            'pwa-extensionHost',
            'pwa-msedge',
            'pwa-node',
          },
        }
      end,
    },
    {
      'Joakker/lua-json5',
      build = './install.sh',
      ft = js_based_languages,
      cond = vim.fn.isdirectory '.vscode',
    },
    {
      'microsoft/vscode-js-debug',
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
      ft = js_based_languages,
      cond = vim.fn.isdirectory '.vscode',
    },
  },
}
