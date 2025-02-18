local wezterm = require "wezterm"
local config = {}
local action = wezterm.action

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Hack Nerd Font'

config.default_cursor_style = 'BlinkingBar'

config.macos_window_background_blur = 20
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_background_opacity = 0.96
config.window_background_image = '/Users/jose.naylor/dev-env/env/.config/wezterm/lotr-ring-wraith.jpg'
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,
}
config.keys= {
	{ key = 'LeftArrow', mods = 'CMD', action = action.SendKey { key = 'Home' } },
	{ key = 'RightArrow', mods = 'CMD', action = action.SendKey { key = 'End' } },
}

return config
