return {
  'folke/trouble.nvim',
  'norcalli/nvim-colorizer.lua',
  'nvim-treesitter/nvim-treesitter-context',
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'theprimeagen/harpoon',
  'stevearc/dressing.nvim',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'mattn/emmet-vim',
  'windwp/nvim-autopairs',
  'tpope/vim-surround',
  'kylechui/nvim-surround',
  'stevearc/conform.nvim', -- prettier

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
      'linrongbin16/lsp-progress.nvim',
      opt = true,
    },
  },

  {
    'linrongbin16/lsp-progress.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },

  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    module = 'tailwindcss-colors',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'onsails/lspkind.nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  },
}
