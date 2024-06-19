local wezterm = require("wezterm")

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
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
	window_background_opacity = 0.97,
	window_background_image = "./grainy (cat).jpg",
	macos_window_background_blur = 90,
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("Dank Mono Nerd Font"),
	font_size = 14,
	-- enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	keys = { { key = "F11", action = wezterm.action.ToggleFullScreen } },
	-- window_decorations = "TITLE | RESIZE",
	window_decorations = "TITLE | RESIZE",
	-- integrated_title_button_style = "Gnome",
}
