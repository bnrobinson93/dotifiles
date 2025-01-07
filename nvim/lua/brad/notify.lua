return {
  'rcarriga/nvim-notify',
  keys = {
    {
      '<leader>un',
      function()
        require('notify').dismiss { silent = true, pending = true }
      end,
      desc = 'Dismiss All Notifications',
    },
  },
  opts = {
    level = 'INFO',
    render = 'wrapped-compact',
    stages = 'slide',
    -- timeout = 1200,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  init = function()
    local notify = require 'notify'
    vim.notify = function(message, level, opts)
      return notify(message, level, opts) -- <-- Important to return the value from `nvim-notify`
    end
  end,
}
