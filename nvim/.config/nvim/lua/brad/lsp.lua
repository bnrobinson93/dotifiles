return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
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
    require('mason').setup()
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
          }
        end,

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

    require('lint').linters_by_ft = {
      typescript = 'eslint_d',
      javascript = 'eslint_d',
    }

    -- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })
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
      '<C-h>',
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
      '<C-Enter>',
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
