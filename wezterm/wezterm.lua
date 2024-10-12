local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == 'ZEN_MODE' then
    local incremental = value:find '+'
    local number_value = tonumber(value)
    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

return {
  enable_wayland = true,
  window_background_opacity = 0.98,
  macos_window_background_blur = 80,
  color_scheme = 'Catppuccin Mocha',
  allow_square_glyphs_to_overflow_width = 'Always',
  warn_about_missing_glyphs = false,
  font = wezterm.font_with_fallback { 'DankMono Nerd Font', 'Fira Code', 'JetBrains Mono' },
  font_size = 15,
  hide_tab_bar_if_only_one_tab = true,

  -- TMUX replacement
  -- Leader is the same as my old tmux prefix
  -- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    -- -- splitting
    -- {
    -- 	mods = "LEADER",
    -- 	key = "-",
    -- 	action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    -- },
    -- {
    -- 	mods = "LEADER",
    -- 	key = "|",
    -- 	action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    -- },
    -- {
    -- 	mods = "LEADER",
    -- 	key = "z",
    -- 	action = wezterm.action.TogglePaneZoomState,
    -- },
    -- -- activate copy mode or vim mode
    -- {
    -- 	key = "[",
    -- 	mods = "LEADER",
    -- 	action = wezterm.action.ActivateCopyMode,
    -- },
    -- {
    -- 	key = "p",
    -- 	mods = "LEADER",
    -- 	action = wezterm.action.PasteFrom("Clipboard"),
    -- },
    -- {
    -- 	key = "/",
    -- 	mods = "LEADER",
    -- 	action = wezterm.action.Search("CurrentSelectionOrEmptyString"),
    -- },
    { key = 'F11', action = wezterm.action.ToggleFullScreen },
  },
  -- search_mode = {
  -- 	{ key = "Escape", mods = "NONE", action = act({ CopyMode = "Close" }) },
  -- 	-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
  -- 	-- to navigate search results without conflicting with typing into the search area.
  -- 	{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
  -- 	{ key = "c", mods = "CTRL", action = "ActivateCopyMode" },
  -- 	{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
  -- 	{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
  -- 	{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
  -- 	{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
  -- },
}
