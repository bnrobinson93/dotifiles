return {
  'Exafunction/codeium.nvim',
  event = 'InsertEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = true,
  opts = {
    enable_chat = 'true',
  },
}
