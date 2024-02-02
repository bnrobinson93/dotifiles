return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs', '<cmd>Git<cr>',         desc = 'Git status' },
    { '<leader>gf', '<cmd>Git fetch<cr>',   desc = 'Git fetch' },
    { '<leader>gp', '<cmd>Git pull<cr>',    desc = 'Git pull' },
    { '<leader>gg', '<cmd>Git push<cr>',    desc = 'Git push' },
    { '<leader>gf', '<cmd>diffget //2<cr>', desc = 'Git diffget 2' },
    { '<leader>gj', '<cmd>diffget //3<cr>', desc = 'Git diffget 3' },
  },
}
