return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'folke/trouble.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'kylechui/nvim-surround',
  'mattn/emmet-vim',
  'mbbill/undotree',
  'norcalli/nvim-colorizer.lua',
  'numToStr/Comment.nvim',
  'nvim-treesitter/nvim-treesitter-context',
  'stevearc/conform.nvim', -- prettier
  'stevearc/dressing.nvim',
  'theprimeagen/harpoon',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'windwp/nvim-autopairs',

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
  {
    'laytan/tailwind-sorter.nvim',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown', 'html' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = function()
      require('tailwind-sorter').setup {
        on_save_enabled = false, -- If `true`, automatically enables on save sorting.
        on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' }, -- The file patterns to watch and sort.
      }
    end,
  },
}
