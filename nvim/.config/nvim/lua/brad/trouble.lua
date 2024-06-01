return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  keys = {
    { '<leader>tt', '<cmd>TroubleToggle<cr>', desc = 'Toggle trouble' },
    { '<leader>twd', '<cmd>Trouble workspace_diagnostics<cr>', desc = 'Toggle trouble workspace_diagnostics' },
    { '<leader>tWd', '<cmd>Trouble document_diagnostics<cr>', desc = 'Toggle trouble document_diagnostics' },
    { '<leader>tq', '<cmd>Trouble quickfix<cr>', desc = 'Toggle trouble quickfix' },
    {
      ']d',
      function()
        local trouble = require 'trouble'
        trouble.open()
        trouble.next { skip_groups = true, jump = true }
        trouble.close()
      end,
      desc = 'Next trouble',
    },
    {
      '[d',
      function()
        local trouble = require 'trouble'
        trouble.open()
        trouble.previous { skip_groups = true, jump = true }
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
