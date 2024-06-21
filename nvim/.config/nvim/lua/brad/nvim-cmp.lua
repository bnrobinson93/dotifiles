return {
  'hrsh7th/nvim-cmp',
  event = 'BufEnter',
  dependencies = {
    'onsails/lspkind.nvim',
    -- AI
    -- 'Exafunction/codeium.nvim',
    -- Autocompletion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    require 'luasnip/loaders/from_vscode'
    lspkind.init { preset = 'codicons' }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Codeium = '' },
        },
      },
      sources = cmp.config.sources {
        { name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 4 },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'path' },
      },
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      experimental = {
        ghost_text = true,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm { select = true, { behavior = cmp.SelectBehavior.Insert } },
        ['<Tab>'] = cmp.mapping.confirm { select = true, { behavior = cmp.SelectBehavior.Insert } },
      },
    }
  end,
}
