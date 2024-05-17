return {
  'tpope/vim-fugitive',
  cond = require('telescope.utils').get_os_command_output { 'git', 'rev-parse', '--is-inside-work-tree' },
  keys = {
    { '<leader>gs', '<cmd>Git<cr>', desc = '[G]it [S]tatus' },
    { '<leader>gd', '<cmd>Gvdiffsplit!<cr>', desc = '[G]it [D]iff in vertical split' },
    { '<leader>gF', '<cmd>Git fetch<cr>', desc = '[G]it [F]etch' },
    { '<leader>gg', '<cmd>Git pull<cr>', desc = '[G]it [P]ull' },
    { '<leader>gp', '<cmd>Git push<cr>', desc = '[G]it [P]ush' },
    { '<leader>gf', '<cmd>diffget //2<cr>', desc = 'Git diffget 2 (left hand)' },
    { '<leader>gj', '<cmd>diffget //3<cr>', desc = 'Git diffget 3 (right hand)' },
  },
}
