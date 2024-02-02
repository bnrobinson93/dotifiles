return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>a', "<cmd>lua =require('harpoon.mark').add_file()<CR>", desc = 'Add file to harpoon' },
    { '<C-e>', "<cmd>lua =require('harpoon.ui').toggle_quick_menu()<CR>", desc = 'Toggle harpoon menu' },
    { '<leader>1', "<cmd>lua =require('harpoon.ui').nav_file(1)<CR>", desc = 'Go to file 1' },
    { '<leader>2', "<cmd>lua =require('harpoon.ui').nav_file(2)<CR>", desc = 'Go to file 2' },
    { '<leader>3', "<cmd>lua =require('harpoon.ui').nav_file(3)<CR>", desc = 'Go to file 3' },
    { '<leader>4', "<cmd>lua =require('harpoon.ui').nav_file(4)<CR>", desc = 'Go to file 4' },
  },
}
