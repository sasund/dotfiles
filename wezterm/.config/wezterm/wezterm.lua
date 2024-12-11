local wezterm = require 'wezterm'
return {
	color_scheme = 'Material (terminal.sexy)',
	enable_tab_bar = true,
	font_size = 14.0,
	font = wezterm.font('JetBrains Mono'),
	macos_window_background_blur = 10,
	
	window_background_opacity = 0.98,
	window_decorations = 'RESIZE',
  send_composed_key_when_left_alt_is_pressed = true,
	keys = {
		{
			key = 'f',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
	  -- Ctrl-click will open the link under the mouse cursor
	  {
	    event = { Up = { streak = 1, button = 'Left' } },
	    mods = 'CTRL',
	    action = wezterm.action.OpenLinkAtMouseCursor,
	  },
	},
}
