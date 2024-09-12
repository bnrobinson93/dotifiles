return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    unchecked = {
      -- Replaces '[ ]' of 'task_list_marker_unchecked'
      icon = '󰄱 ',
      -- Highlight for the unchecked icon
      highlight = 'RenderMarkdownUnchecked',
    },
    checked = {
      -- Replaces '[x]' of 'task_list_marker_checked'
      icon = '󰱒 ',
      -- Highligh for the checked icon
      highlight = 'RenderMarkdownChecked',
    },
    custom = {
      todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
    },
  },
}
