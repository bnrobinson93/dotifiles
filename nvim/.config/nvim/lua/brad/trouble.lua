return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>tt', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Toggle buffer diagnostics' },
    { '<leader>td', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle trouble' },
    { '<leader>tq', '<cmd>Trouble qflist toggle<cr>', desc = 'Toggle trouble quickfix' },
    {
      ']d',
      function()
        local trouble = require 'trouble'
        trouble.next { mode = 'diagnostics', skip_groups = true, jump = true }
        trouble.close()
      end,
      desc = 'Next trouble',
    },
    {
      '[d',
      function()
        local trouble = require 'trouble'
        trouble.prev { mode = 'diagnostics', skip_groups = true, jump = true }
        trouble.close()
      end,
      desc = 'Previous trouble',
    },
  },
  opts = {
    multiline = false, -- render multi-line messages
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
  },
}
