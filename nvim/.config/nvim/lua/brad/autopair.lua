return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  enabled = false,
  opts = {
    check_ts = true,
    ts_config = {
      lua = { 'string', 'source' },
      javascript = { 'string', 'template_string' },
      typescript = { 'string', 'template_string' },
    },
    disable_filetype = { 'TelescopePrompt', 'vim' },
  },
}
