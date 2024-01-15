return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/nvim-cmp',
  },
  opts = {
    check_ts = true,
    ts_config = {
      lua = { 'string', 'source' },
      javascript = { 'string', 'template_string' },
      typescript = { 'string', 'template_string' },
    },
    disable_filetype = { 'TelescopePrompt', 'vim' },
  },
  config = function()
    local status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
    if not status_ok then
      return
    end

    local status2_ok, cmp = pcall(require, 'cmp')
    if not status2_ok then
      return
    end

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
