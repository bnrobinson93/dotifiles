local status_ok, prog = pcall(require, 'lsp-progress')
if not status_ok then
  vim.notify 'Unable to source lsp-progress'
  return
end

prog.setup()
