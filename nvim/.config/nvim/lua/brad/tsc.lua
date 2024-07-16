return {
  'dmmulroy/tsc.nvim',
  ft = { 'typescript', 'typescriptreact', 'react', 'typescriptreact', 'javascript', 'javascriptreact' },
  cmd = 'TSC',
  opts = {
    auto_start_watch_mode = true,
    use_trouble_qflist = true,
    use_diagnostics = true,
    hide_progress_notifications_from_history = true,
    flags = {
      noEmit = true,
    },
  },
}
