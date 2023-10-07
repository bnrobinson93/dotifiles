local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua        = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    typescript = { 'string', 'template_string' }
  },
  disable_filetype = { 'TelescopePrompt', 'vim' }
})

local status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not status_ok then
  return
end

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
