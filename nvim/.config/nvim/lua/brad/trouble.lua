return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle trouble' },
    { '<leader>td', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Toggle buffer diagnostics' },
    { '<leader>tq', '<cmd>Trouble qflist toggle<cr>', desc = 'Toggle trouble quickfix' },
    {
      ']d',
      function()
        local trouble = require 'trouble'
        trouble.open { mode = 'diagnostics' }
        trouble.next { skip_groups = true, jump = true }
        trouble.close { mode = 'diagnostics' }
      end,
      desc = 'Next trouble',
    },
    {
      '[d',
      function()
        local trouble = require 'trouble'
        trouble.open { mode = 'diagnostics' }
        trouble.previous { skip_groups = true, jump = true }
        trouble.close { mode = 'diagnostics' }
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
