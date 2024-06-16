return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    focus = true,
    multiline = true, -- render multi-line messages
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
    warn_no_results = false,
  },
  keys = {
    { '<leader>tt', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Toggle buffer diagnostics' },
    { '<leader>td', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle trouble' },
    { '<leader>tq', '<cmd>Trouble qflist toggle<cr>', desc = 'Toggle trouble quickfix' },
    { ']d', '<cmd>Trouble diagnostics next<cr><cmd>Trouble close<cr>', desc = 'Next trouble' },
    { ']d', '<cmd>Trouble diagnostics prev<cr><cmd>Trouble close<cr>', desc = 'Prev trouble' },
  },
}
