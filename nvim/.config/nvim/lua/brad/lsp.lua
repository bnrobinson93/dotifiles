return {
  'williamboman/mason-lspconfig.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'j-hui/fidget.nvim',
    'mfussenegger/nvim-lint',
  },
  config = function()
    require('fidget').setup {
      notification = { window = { winblend = 0 } },
    }
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }
    require('mason-lspconfig').setup {
      automatic_install = true,
      ensure_installed = { 'tsserver', 'bashls', 'cssls', 'lua_ls', 'tailwindcss' },
      handlers = {
        function(name)
          require('lspconfig')[name].setup {}
        end,

        ['tsserver'] = function()
          local lspconfig = require 'lspconfig'
          local util = require 'lspconfig.util'
          lspconfig.tsserver.setup {
            root_dir = util.root_pattern '.git',
            path = '$HOME/.local/share/pnpm/tsc',
            on_attach = function(client)
              client.server_capabilities.semanticTokensProvider = nil
              client.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
            end,
          }
        end,

        --[[ ['vtsls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.configs = require('vtsls').lspconfig
          lspconfig.vtsls.setup {
            refactor_auto_rename = true,
            experimental = {
              completion = { enableServerSideFuzzyMatch = false, entriesLimit = 10, includePackageJsonAutoImports = 'off' },
            },
            typescript = {
              inlayHints = {
                parameterNames = { enabled = 'literals' },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          }
        end, ]]

        ['tailwindcss'] = function()
          local lspconfig = require 'lspconfig'
          local util = require 'lspconfig.util'
          lspconfig.tailwindcss.setup {
            validate = true,
            root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts'),
            on_attach = function(_, bufnr)
              require('tailwindcss-colors').buf_attach(bufnr)
            end,
          }
        end,

        ['lua_ls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.lua_ls.setup {
            settings = {
              Lua = { diagnostics = { globals = { 'vim' } } },
            },
          }
        end,
      },
    }

    local signs = { Error = ' ', Warning = ' ', Hint = ' ', Information = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.diagnostic.config {
      virtual_text = true,
      check_current_line = true,
      severity_sort = true,
      float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    })

    -- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
    -- Also hides the text at the bottom, see https://github.com/neovim/neovim/issues/20457#issuecomment-1266782345
    vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
      config = config or {}
      config.focus_id = ctx.method
      config.border = 'rounded'
      if not (result and result.contents) then
        return
      end
      local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
      markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
      if vim.tbl_isempty(markdown_lines) then
        return
      end
      return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
    end
  end,
  keys = {
    {
      'gd',
      function()
        vim.lsp.buf.definition()
      end,
      desc = '[G]oto [D]efinition',
    },
    {
      'gr',
      function()
        vim.lsp.buf.references()
      end,
      desc = '[G]oto [R]eferences',
    },
    {
      'K',
      function()
        vim.lsp.buf.hover { float = { border = 'rounded' } }
      end,
    },
    -- { '[d', function() vim.diagnostic.goto_prev() end },
    -- { ']d', function() vim.diagnostic.goto_next() end },
    {
      '<F1>',
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = 'Signature [H]elp',
    },
    {
      '<leader>vws',
      --function()
      --  vim.lsp.buf.workspace_symbol()
      --end,
      '<cmd>Telescope lsp_workspace_symbols<CR>',
      desc = '[V]iew [W]orkspace [S]ymbol',
    },
    {
      '<leader>vd',
      function()
        vim.diagnostic.open_float(0, { scope = 'cursor' })
      end,
      desc = '[V]iew [D]iagnostic',
    },
    {
      '<C-Space>',
      function()
        vim.lsp.buf.code_action()
      end,
      desc = 'Code actions (VSCode)',
    },
    {
      '<leader>vca',
      function()
        vim.lsp.buf.code_action()
      end,
      desc = '[V]im [C]ode [A]ction',
    },
    {
      '<leader>vr',
      function()
        vim.lsp.buf.references()
      end,
      desc = '[Vim] [R]efrences',
    },
    {
      '<leader>vrn',
      function()
        vim.lsp.buf.rename()
      end,
      desc = '[Vim] [R]e[N]ame',
    },
  },
}
