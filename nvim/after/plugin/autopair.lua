local npairs = require('nvim-autopairs')

npairs.setup({
  check_ts = true,
  ts_config = {
    lua        = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    typescript = { 'string', 'template_string' }
  },
  disable_filetype = { 'TelescopePrompt', 'vim' }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
