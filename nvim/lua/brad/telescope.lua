return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cond = require('telescope.utils').get_os_command_output { 'git', 'rev-parse', '--is-inside-work-tree' },
  cmd = 'Telescope',
  keys = {
    { '<C-b>', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Git files' },
    { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<leader>phf', '<cmd>Telescope find_files hidden=true<cr>', desc = 'Find files' },
    { '<leader>ps', '<cmd>Telescope live_grep<cr>', desc = 'live_grep' },
    { '<leader>phs', '<cmd>Telescope live_grep hidden=true<cr>', desc = 'live_grep' },
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
