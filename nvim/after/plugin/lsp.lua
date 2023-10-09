local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
  vim.notify 'Unable to load lsp zero'
  return
end

local status_ok, nvim_lsp = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify 'Unable to load lsp zero'
  return
end

lsp.preset 'recommended'

require('mason').setup {}
require('mason-lspconfig').setup {
  ensure_installed = { 'tsserver', 'eslint', 'bashls', 'cssls', 'lua_ls', 'tailwindcss' },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      nvim_lsp.lua_ls.setup(lua_opts)
    end,
  },
}

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp.default_keymaps(opts)
  lsp.buffer_autoformat()

  vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition()
  end, opts) -- default
  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover()
  end, opts) -- default
  vim.keymap.set('n', '<leader>vws', function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set('n', '<leader>vd', function()
    vim.diagnostic.open_float()
  end, opts) -- Same as gl
  vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_next()
  end, opts) -- default
  vim.keymap.set('n', ']d', function()
    vim.diagnostic.goto_prev()
  end, opts) -- default
  vim.keymap.set('n', '<leader>vca', function()
    vim.lsp.buf.code_action()
  end, opts) -- Same as F4
  vim.keymap.set('n', '<leader>vrr', function()
    vim.lsp.buf.references()
  end, opts) -- Same as gr
  vim.keymap.set('n', '<leader>vrn', function()
    vim.lsp.buf.rename()
  end, opts) -- Same as F2
  vim.keymap.set('n', '<C-h>', function()
    vim.lsp.buf.signature_help()
  end, opts) -- Same as gs
end)

lsp.set_sign_icons {
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '',
}

vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

lsp.format_on_save {
  format_opts = {
    async = true,
    timeout_ms = 10000,
  },
  servers = {
    ['eslint_d'] = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tailwindcss' },
    ['prettier_d'] = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tailwindcss' },
  },
}

local util = require 'lspconfig.util'

nvim_lsp.tsserver.setup {
  root_dir = util.root_pattern '.git',
}

nvim_lsp.tailwindcss.setup {
  validate = true,
  root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts'),
  on_attach = function(_, bufnr)
    require('tailwindcss-colors').buf_attach(bufnr)
  end,
}
