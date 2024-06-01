return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufReadPre',
  config = function()
    require('colorizer').setup {
      filetypes = { '*', '!vim', '!prompt', '!popup' },
    }
  end,
}
