return {
  'Exafunction/codeium.nvim',
  enabled = false,
  event = 'InsertEnter',
  dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
  config = true,
  opts = {
    enable_chat = 'false',
  },
}
