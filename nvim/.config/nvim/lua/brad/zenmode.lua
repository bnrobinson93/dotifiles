return {
  'folke/zen-mode.nvim',
  plugins = {
    alacritty = {
      enabled = true,
      font = '17',
    },
    tmux = { enabled = true },
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en mode' },
  },
}
