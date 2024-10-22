local wezterm = require 'wezterm'

local ROUND_LEFT = utf8.char(tonumber '0xe0b6' or 0)
local ROUND_RIGHT = utf8.char(tonumber '0xe0b4' or 0)

wezterm.on('update-right-status', function(window, _)
  local COLOR = '#afd7af'
  local prefix = utf8.char(tonumber '0xe795' or 0) .. ' '

  if window:leader_is_active() then
    COLOR = '#ff87af'
  end

  local pane = window:active_pane()
  local title = pane:get_title()

  window:set_left_status(wezterm.format {
    { Background = { Color = '#1e1e2e' } },
    { Foreground = { Color = COLOR } },
    { Text = ' ' .. ROUND_LEFT },
    { Background = { Color = COLOR } },
    { Foreground = { Color = '#262626' } },
    { Text = prefix },
    { Foreground = { Color = '#d7d7ff' } },
    { Background = { Color = '#3a3a3a' } },
    { Text = ' ' .. title },
    'ResetAttributes',
    { Foreground = { Color = '#3a3a3a' } },
    { Background = { Color = '#1e1e2e' } },
    { Text = ROUND_RIGHT .. ' ' },
  })
end)

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

-- { Foreground = { Color = '#262626' } },
-- { Background = { Color = '#ffafd7' } },
-- { Text = ROUND_LEFT },
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab_title(tab)
  local id = tab.tab_id

  if tab.is_active then
    return {
      'ResetAttributes',
      { Foreground = { Color = '#262626' } },
      { Background = { Color = '#1e1e2e' } },
      { Text = ROUND_LEFT },
      { Background = { Color = '#262626' } },
      { Foreground = { Color = '#d7d7ff' } },
      { Text = title .. ' ' },
      { Foreground = { Color = '#262626' } },
      { Background = { Color = '#ffaf87' } },
      { Text = ' ' .. id },
      { Background = { Color = '#1e1e2e' } },
      { Foreground = { Color = '#ffaf87' } },
      { Text = ROUND_RIGHT .. ' ' },
    }
  end
  return {
    'ResetAttributes',
    { Foreground = { Color = '#3a3a3a' } },
    { Background = { Color = '#1e1e2e' } },
    { Text = ROUND_LEFT },
    { Background = { Color = '#3a3a3a' } },
    { Foreground = { Color = '#d7d7ff' } },
    { Text = title .. ' ' },
    { Foreground = { Color = '#262626' } },
    { Background = { Color = '#87afff' } },
    { Text = ' ' .. id },
    { Background = { Color = '#1e1e2e' } },
    { Foreground = { Color = '#87afff' } },
    { Text = ROUND_RIGHT .. ' ' },
  }
end)
