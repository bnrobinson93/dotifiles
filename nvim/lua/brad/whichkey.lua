return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 1000,
    plugins = {
      presets = { motion = false },
    },
    spec = {
      mode = { "n", "v" },
      { "<leader>g", group = "Git" },
      { "<leader>p", group = "Project file/find" },
      { "<leader>v", group = "Vim" },
      { "<leader>t", group = "Toggle" },
      {
        "<leader>b",
        group = "buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
    },
  },
}
