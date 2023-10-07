local status_ok, ts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  vim.notify("Unable to load treesitter")
  return
end

ts.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript" },
  sync_install = false,
  auto_install = false,
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-s>',
      node_incremental = '<C-s>',
      scope_incremental = false,
      node_decremental = '<bs>'
    }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}
