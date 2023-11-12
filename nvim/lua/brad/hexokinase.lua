return {
  'RRethy/vim-hexokinase',
  events = 'VimEnter',
  --[[ build = 'make hexokinase', ]]
  config = function()
    vim.g.Hexokinase_highlighters = { 'backgroundfull' }
  end,
}
