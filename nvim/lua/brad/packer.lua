-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colors
  use('norcalli/nvim-colorizer.lua')
  use('nvim-treesitter/nvim-treesitter', { run = ':tsupdate' })
  use('nvim-treesitter/nvim-treesitter-context')
  use({
    "oxfist/night-owl.nvim",
    as = 'night-owl',
    config = function()
      vim.cmd('colorscheme night-owl')
    end
  })

  -- File Navigation
  use('theprimeagen/harpoon')
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  -- Status Line
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- Make select boxes nicer
  --  use "stevearc/dressing.nvim"

  -- undo tree
  use('mbbill/undotree')

  -- git
  use('tpope/vim-fugitive')

  -- VSCode-like junk
  use "themaxmarchuk/tailwindcss-colors.nvim"
  use { 'MunifTanjim/prettier.nvim',
    requires = { 'jose-elias-alvarez/null-ls.nvim' }
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
    }
  }
end)
