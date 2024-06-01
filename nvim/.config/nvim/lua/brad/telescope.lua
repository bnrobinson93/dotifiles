return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = 'Telescope',
  opts = {
    defaults = {
      mappings = {
        i = { ['<c-t>'] = require('trouble.sources.telescope').open },
        n = { ['<c-t>'] = require('trouble.sources.telescope').open },
      },
    },
  },
  keys = {
    { '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Git files' },
    { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<leader>ps', '<cmd>Telescope live_grep<cr>', desc = 'live_grep' },
    {
      '<leader>pws',
      '<cmd>Telescope grep_string<cr>',
      desc = 'grep_string',
    },
    {
      '<leader>pWs',
      function()
        local word = vim.fn.expand '<cWORD>'
        require('telescope.builtin').grep_string { search = word }
      end,
      desc = 'grep full string under the cursor',
    },
  },
}
