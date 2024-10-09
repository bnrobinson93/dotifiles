return {
  '3rd/image.nvim',
  cond = vim.env.KITTY_WINDOW_ID ~= nil,
  opts = {
    backend = 'kitty',
    html = { enabled = true },
    css = { enabled = true },
    tmux_show_only_in_active_window = true,
    integrations = { markdown = { enabled = true, download_remote_images = true } },
  },
}
