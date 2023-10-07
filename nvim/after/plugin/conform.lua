local status_ok, conform = pcall(require, "conform")
if not status_ok then return end

conform.setup({
  formatters_by_ft = {
    javascript = { "prettierd" },
    javascriptreact = { 'prettierd' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    json = { 'prettierd' },
    graphql = { 'prettierd' },
    yaml = { 'prettierd' },
    markdown = { 'prettierd' },
    lua = { 'stylua' }
  },
  format_on_save = {
    lsp_callback = true,
    async = false,
    timeout_ms = 500
  }
})

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  vim.notify("Formatting with conform")
  conform.format({
    lsp_callback = true,
    async = false,
    timeout_ms = 500
  })
end, { desc = "Format on file or range" })
