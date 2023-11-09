function AddColor(color)
  color = color or 'night-owl'
  vim.cmd.colorscheme(color)

  --[[ vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' }) ]]
  --[[ vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }) ]]
end

local status_ok, catppuccin = pcall(require, 'catppuccin')
if not status_ok then
  vim.notify 'Unable to load catppuccin theme'
  return
end

catppuccin.setup {
  flavour = 'mocha',
  transparent_background = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    harpoon = true,
    telescope = { enabled = true },
    treesitter = true,
  },
}

AddColor 'catppuccin-mocha'
