vim.g.skip_ts_context_commentstring_module = true

return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
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
}
