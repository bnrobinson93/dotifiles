local status_ok, mark = pcall(require, 'harpoon.mark')
if not status_ok then
  vim.notify 'Unable to load harpoon mark'
  return
end

local status_ok2, ui = pcall(require, 'harpoon.ui')
if not status_ok2 then
  vim.notify 'Unable to load harpoon ui'
  return
end

return {
  'ThePrimeagen/harpoon',
  keys = {
    { '<leader>a', mark.add_file,                 desc = "Add file to harpoon" },
    { '<C-e>',     ui.toggle_quick_menu,          desc = "Toggle harpoon menu" },
    { '<leader>1', function() ui.nav_file(1) end, desc = "Go to file 1" },
    { '<leader>2', function() ui.nav_file(2) end, desc = "Go to file 2" },
    { '<leader>3', function() ui.nav_file(3) end, desc = "Go to file 3" },
    { '<leader>4', function() ui.nav_file(4) end, desc = "Go to file 4" },
  },
}
