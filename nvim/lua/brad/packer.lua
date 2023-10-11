-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify 'Unable to load Packer'
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'
  use('nvim-treesitter/nvim-treesitter', { run = ':tsupdate' })
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    'oxfist/night-owl.nvim',
    as = 'night-owl',
    config = function()
      vim.cmd 'colorscheme night-owl'
    end,
  }

  -- Commentary
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- File Navigation
  use 'theprimeagen/harpoon'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  -- Status Line
  use { 'nvim-lualine/lualine.nvim', requires = {
    'nvim-tree/nvim-web-devicons',
    'linrongbin16/lsp-progress.nvim',
    opt = true,
  } }
  use {
    'linrongbin16/lsp-progress.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lsp-progress').setup()
    end,
  }

  -- Make select boxes nicer
  use 'stevearc/dressing.nvim'

  -- undo tree
  use 'mbbill/undotree'

  -- git
  use 'tpope/vim-fugitive'

  use 'mattn/emmet-vim'

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  }
  use 'tpope/vim-surround'

  use {
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  }

  use {
    'themaxmarchuk/tailwindcss-colors.nvim',
    module = 'tailwindcss-colors',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  }

  -- Prettier
  use {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup()
    end,
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
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
  }
end)
