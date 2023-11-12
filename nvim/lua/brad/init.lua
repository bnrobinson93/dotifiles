return {

  -- Colors
  'norcalli/nvim-colorizer.lua',
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    --[[ build = ':TSUpdate', ]]
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  'nvim-treesitter/nvim-treesitter-context',
  --[[ { 'oxfist/night-owl.nvim', as = 'night-owl' }, ]]
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  -- Commentary
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- File Navigation
  'theprimeagen/harpoon',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  -- Status Line
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
    config = function()
      require('lsp-progress').setup()
    end,
  },

  -- Make select boxes nicer
  'stevearc/dressing.nvim',

  -- undo tree
  'mbbill/undotree',

  -- git
  'tpope/vim-fugitive',

  'mattn/emmet-vim',

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },
  'tpope/vim-surround',
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    module = 'tailwindcss-colors',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },
  -- Prettier
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup()
    end,
  },
  -- LSP
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
