return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'folke/trouble.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'kylechui/nvim-surround',
  'mattn/emmet-vim',
  'mbbill/undotree',
  'numToStr/Comment.nvim',
  'nvim-treesitter/nvim-treesitter-context',
  'stevearc/conform.nvim', -- prettier
  'stevearc/dressing.nvim',
  -- 'tpope/vim-fugitive',
  'NeogitOrg/neogit',
  'tpope/vim-surround',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      -- 'linrongbin16/lsp-progress.nvim',
      opt = true,
    },
  },

  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },

  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },
}
