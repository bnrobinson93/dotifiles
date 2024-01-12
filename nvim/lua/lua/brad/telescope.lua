return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = 'Telescope',
  keys = {
    { '<C-p>',      '<cmd>Telescope git_files<cr>',  desc = 'Git files' },
    { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<leader>ps', '<cmd>Telescope grep_string<cr>',  desc = 'grep_string' },
    { '<leader>pws', function() 
      local word = vim.fn.expand('<cword>')
      require('telescope.builtin').grep_string({ search = word })
    end,  desc = 'live_grep' },
    { '<leader>pWs', function() 
      local word = vim.fn.expand('<cWORD>')
      require('telescope.builtin').grep_string({ search = word })
    end,  desc = 'live_grep' },
  },
}
