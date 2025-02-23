local wezterm = require "wezterm"
local config = {}
local action = wezterm.action
local home = os.getenv( "HOME" )

config.color_scheme = 'Catppuccin Mocha'
--config.font = wezterm.font 'Hack Nerd Font'

config.default_cursor_style = 'BlinkingBar'

--config.macos_window_background_blur = 20
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
--config.window_background_opacity = 0.50
config.window_background_image = home .. '/.config/wezterm/bg.png'
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.1,
}
config.keys= {
	{ key = 'LeftArrow', mods = 'CMD', action = action.SendKey { key = 'Home' } },
	{ key = 'RightArrow', mods = 'CMD', action = action.SendKey { key = 'End' } },
}

return config
