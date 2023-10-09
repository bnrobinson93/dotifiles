local status_ok, mark = pcall(require, 'harpoon.mark')
if not status_ok then
  vim.notify 'Unable to load harpoon'
  return
end

local status_ok, ui = pcall(require, 'harpoon.ui')
if not status_ok then
  vim.notify 'Unable to load harpoon'
  return
end

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-j>', function()
  ui.nav_file(1)
end)
vim.keymap.set('n', '<C-k>', function()
  ui.nav_file(2)
end)
vim.keymap.set('n', '<C-l>', function()
  ui.nav_file(3)
end)
vim.keymap.set('n', '<C-;>', function()
  ui.nav_file(4)
end)
