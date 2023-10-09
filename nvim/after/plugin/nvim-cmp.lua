local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  vim.notify 'Unable to load cmp'
  return
end

local status_ok, lspkind = pcall(require, 'lspkind')
if not status_ok then
  vim.notify 'Unable to load lsp kind'
  return
end

require 'luasnip.loaders.from_vscode'
lspkind.init { preset = 'codicons' }

local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
  vim.notify 'Unable to load lsp zero'
  return
end

local cmp_action = lsp.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
    },
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    --completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    -- navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm { select = false },
    ['<tab>'] = cmp.mapping.confirm { select = false },
  },
}
