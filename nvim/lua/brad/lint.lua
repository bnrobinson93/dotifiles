return {
  'mfussenegger/nvim-lint',
  setup = function()
    require('lint').linters_by_ft = {
      markdown = { 'vale' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
        require('lint').try_lint 'cspell'
      end,
    })
  end,
}
