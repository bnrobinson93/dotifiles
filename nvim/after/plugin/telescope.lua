local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
  vim.notify 'Unable to load telescope'
  return
end
