-- This Lualine config should be somewhere in your config files
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify 'Unable to load lualine'
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'night-owl',
    -- section_separators = '',
    -- component_separators = ''
  },
}
