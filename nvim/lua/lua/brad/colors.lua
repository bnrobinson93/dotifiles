return {
  'catppuccin/nvim',
  config = function()
    require("catppuccin").setup({
      flavour = 'mocha',
      transparent_background = true,
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        harpoon = true,
        telescope = { enabled = true },
        treesitter = true,
      }
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
