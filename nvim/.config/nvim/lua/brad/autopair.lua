return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'lua', 'go', 'python', 'css', 'scss' },
  opts = {
    check_ts = true,
    disable_in_macro = true,
    ts_config = {
      lua = { 'string', 'source' },
      javascript = { 'string', 'template_string' },
      typescript = { 'string', 'template_string' },
    },
    disable_filetype = { 'TelescopePrompt', 'vim' },
  },
}
