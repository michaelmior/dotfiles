-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Hybrid'

config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 14

-- and finally, return the configuration to wezterm
return config
