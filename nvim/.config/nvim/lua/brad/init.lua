return {
  'fo>ke/trouble.nvim', -- diagnostic panel
  'mbbill/undotree', -- tre view of history
  'NeogitOrg/neogit', -- Git
  'nvim-treesitter/nvim-treesitter-context', -- jump to context
  'stevearc/conform.nvim', -- formatting
  'stevearc/dressing.nvim', -- Better select and insert boxes

  -- Theme
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  -- Change, add, or remove surrounding pairs
  { 'kylechui/nvim-surround', version = '*', opts = {} },

  -- Smart Commenting for sub-languages (JSX)
  { 'JoosepAlviste/nvim-ts-context-commentstring', opts = { enable_autocmd = false } },

  -- Comments
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
      local prehook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      require('Comment').setup { pre_hook = prehook }
    end,
  },

  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  -- syntax highlighting and code tree builder
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- search
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      -- 'linrongbin16/lsp-progress.nvim',
      opt = true,
    },
  },

  -- auto close and udpate html tags
  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },

  -- Display color of tailwind on top of class
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    ft = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'markdown' },
  },
}
