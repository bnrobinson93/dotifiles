return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 0.95,
      options = { signcolumn = 'no' },
    },
    plugins = {
      options = { enabled = true, laststatus = 0 },
      alacritty = {
        enabled = false,
        font = '17',
      },
      wezterm = {
        enabled = true,
        font = '+3',
      },
      gitsgns = { enabled = true },
      tmux = { enabled = true },
    },
  },
  keys = {
    { '<leader>z', '<CMD>ZenMode<CR>', mode = { 'n' }, desc = 'Toggle [Z]en mode' },
  },
}
