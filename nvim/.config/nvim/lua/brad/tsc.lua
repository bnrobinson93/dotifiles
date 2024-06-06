return {
  'dmmulroy/tsc.nvim',
  ft = { 'typescript', 'typescriptreact', 'react', 'typescriptreact', 'javascript', 'javascriptreact' },
  cmd = 'TSC',
  config = function()
    require('tsc').setup {
      flags = {
        noEmit = true,
      },
    }
  end,
}
