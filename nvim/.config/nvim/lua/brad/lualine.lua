local lsp_names = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return '[' .. table.concat(c, ',') .. ']'
end

local lazy_status = require 'lazy.status'

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      always_divide_middle = true,
      section_separators = { left = '', right = '' },
      component_separators = '|',
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
      lualine_c = { { lsp_names, color = { fg = '#585b70' } } },
      lualine_x = {
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = 'orange' },
          left_padding = 1,
        },
      },
      lualine_y = {
        'encoding',
        'fileformat',
        'filetype',
      },
    },
  },
}
