-- This Lualine config should be somewhere in your config files
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify 'Unable to load lualine'
  return
end

local status_ok, prog = pcall(require, 'lsp-progress')
if not status_ok then
  vim.notify 'Unable to load lsp-progress'
  return
end

-- LSP clients attached to buffer
local clients_lsp = function()
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

local function LspStatus()
  return prog.progress {
    format = function(messages)
      return #messages > 0 and table.concat(messages, ' ') or ''
    end,
  }
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'night-owl',
    --[[ section_separators = '',
    component_separators = '', ]]
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { clients_lsp, LspStatus },
  },
}

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup('lualine_augroup', { clear = true })
vim.api.nvim_create_autocmd('User', {
  group = 'lualine_augroup',
  pattern = 'LspProgressStatusUpdated',
  callback = lualine.refresh,
})
