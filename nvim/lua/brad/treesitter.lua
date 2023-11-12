return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  keys = {
    { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    {
      '<leader>ps',
      function()
        builtin.grep_string { search = vim.fn.input 'Grep > ' }
      end,
    },
    { '<C-p>',      '<cmd>Telescope git_files<cr>',  'Git files' },
  },
}
