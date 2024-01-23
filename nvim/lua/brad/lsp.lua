return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'j-hui/fidget.nvim',
  },
  config = function()
    require('fidget').setup {
      notification = { window = { winblend = 0 } },
    }
    require('mason').setup()
    require('mason-lspconfig').setup {
      automatic_install = true,
      ensure_installed = { 'tsserver', 'eslint', 'bashls', 'cssls', 'lua_ls', 'tailwindcss' },
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
  end,
  keys = {
    {
      'gd',
      function()
        vim.lsp.buf.definition()
      end,
    },
    {
      'gr',
      function()
        vim.lsp.buf.references()
      end,
    },
    {
      'K',
      function()
        vim.lsp.buf.hover()
      end,
    },
    -- { '[d', function() vim.diagnostic.goto_prev() end },
    -- { ']d', function() vim.diagnostic.goto_next() end },
    {
      '<C-h>',
      function()
        vim.lsp.buf.signature_help()
      end,
    },
    {
      '<leader>vws',
      function()
        vim.lsp.buf.workspace_symbol()
      end,
    },
    {
      '<leader>vd',
      function()
        vim.lsp.buf.open_float()
      end,
    },
    {
      '<leader>vca',
      function()
        vim.lsp.buf.code_action()
      end,
    },
    {
      '<leader>vrr',
      function()
        vim.lsp.buf.references()
      end,
    },
    {
      '<leader>vrn',
      function()
        vim.lsp.buf.rename()
      end,
    },
  },
}
