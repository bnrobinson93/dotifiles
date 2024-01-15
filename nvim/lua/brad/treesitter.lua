vim.g.skip_ts_context_commentstring_module = true

return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'VeryLazy' },
  lazy = false,
  init = function(plugin)
    -- https://www.lazyvim.org/plugins/treesitter
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treeitter** module to be loaded in time.
    -- Luckily, the only thins that those plugins need are the custom queries, which we make available
    -- during startup.
    require('lazy.core.loader').add_to_rtp(plugin)
    require 'nvim-treesitter.query_predicates'
  end,
  config = function(_, opts)
    if type(opts.ensure_installed) == 'table' then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    require('nvim-treesitter.configs').setup(opts)

    require('treesitter-context').setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'typescript', 'javascript' },
      sync_install = false,
      auto_install = false,
      indent = { enable = true },
      autotag = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
    require('nvim-treesitter.configs').setup {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-s>',
          node_incremental = '<C-s>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    }
  end,
}
