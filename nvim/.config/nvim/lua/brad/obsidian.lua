return {
  'epwalsh/obsidian.nvim',
  ft = 'markdown',
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/Vault/*.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Vault/*.md',
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    workspaces = {
      { name = 'personal', path = '~/Documents/Vault' },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    daily_notes = {
      folder = 'Periodic/Daily',
      date_format = '%Y-%m-%d',
      template = 'resources/templates/daily.md',
    },
    templates = {
      folder = 'resources/templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
    },
    new_notes_location = 'notes_subdir',
    ui = {
      enable = true,
      checkboxes = {
        [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '', hl_group = 'ObsidianDone' },
        ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
        ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
        ['!'] = { char = '', hl_group = 'ObsidianImportant' },
      },
      bullets = { char = '•', hl_group = 'ObsidianBullet' },
      external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
      reference_text = { hl_group = 'ObsidianRefText' },
      highlight_text = { hl_group = 'ObsidianHighlightText' },
      tags = { hl_group = 'ObsidianTag' },
      block_ids = { hl_group = 'ObsidianBlockID' },
    },
    attachments = {
      img_folder = 'resources/attachments',
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>x'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
  },
}
