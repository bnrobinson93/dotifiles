return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>f',
      function()
        vim.notify 'Formatting with conform'
        require('conform').format {
          lsp_callback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      mode = { 'n', 'v' },
      desc = 'Format on file or range',
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescript = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      graphql = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      lua = { 'stylua' },
    },
    format_on_save = {
      async = false,
      lsp_callback = true,
      timeout_ms = 500,
    },
  },
}
