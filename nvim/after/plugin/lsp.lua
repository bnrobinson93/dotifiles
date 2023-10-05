local lsp = require('lsp-zero')

lsp.preset("recommended")

-- sFix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp.default_keymaps(opts)
  lsp.buffer_autoformat()

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)            -- default
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)                  -- default
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts) -- Same as gl
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)          -- default
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)          -- default
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)  -- Same as F4
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)   -- Same as gr
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)       -- Same as F2
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)     -- Same as gs
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'eslint', 'bashls', 'cssls', 'lua_ls', 'tailwindcss' },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = lsp.cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

local lspkind = require('lspkind')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  window = {
    --completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.confirm({ select = false }),

  })
})

local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup({
  root_dir = require('lspconfig.util').root_pattern('.git')
})

nvim_lsp.tailwindcss.setup({
  on_attach = function(_, bufnr)
    require("tailwindcss-colors").buf_attach(bufnr)
  end
})

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['eslint_d'] = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tailwindcss' },
    ['prettier_d'] = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tailwindcss' },
  }
})
