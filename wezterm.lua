-- Pull in the wezterm API
local wezterm = require 'wezterm'
local action = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Solarized Dark - Patched'
-- config.color_scheme = 'Solarized (dark) (terminal.sexy)'
-- config.color_scheme = 'Solarized Dark Higher Contrast'

config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'devbox',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = 'devbox.databricks.com',
    -- The username to use on the remote host
    username = 'ahirreddy',
  },
}

config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'

config.keys = {
  { key = 'd', mods = 'CMD|SHIFT', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'k', mods = 'CMD', action = action.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'w', mods = 'CMD', action = action.CloseCurrentPane { confirm = false } },
  { key = 'w', mods = 'CMD|SHIFT', action = action.CloseCurrentTab { confirm = false } },
  { key = 'LeftArrow', mods = 'CMD', action = action.SendKey { key = 'Home' } },
  { key = 'RightArrow', mods = 'CMD', action = action.SendKey { key = 'End' } },
  { key = 'p', mods = 'CMD|SHIFT', action = action.ActivateCommandPalette },
}

-- Font settings
config.font = wezterm.font("Monaco")
config.font_size = 12.0

-- Font rendering settings
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Disable ligatures
-- config.font_antialias = "Subpixel" -- Force antialiasing
-- config.font_hinting = "Full" -- Enable full hinting

-- Colors
config.colors = {
  foreground = "#839496",
  background = "#002B36",
  cursor_bg = "#839496",
  cursor_fg = "#002B36",
  cursor_border = "#839496",
  selection_fg = "#839496",
  selection_bg = "#073642",
  ansi = {
    "#073642", -- Black (Ansi 0)
    "#DC322F", -- Red (Ansi 1)
    "#859900", -- Green (Ansi 2)
    "#B58900", -- Yellow (Ansi 3)
    "#268BD2", -- Blue (Ansi 4)
    "#D33682", -- Magenta (Ansi 5)
    "#2AA198", -- Cyan (Ansi 6)
    "#EEE8D5", -- White (Ansi 7)
  },
  brights = {
    "#002B36", -- Bright Black (Ansi 8)
    "#CB4B16", -- Bright Red (Ansi 9)
    "#586E75", -- Bright Green (Ansi 10)
    "#657B83", -- Bright Yellow (Ansi 11)
    "#839496", -- Bright Blue (Ansi 12)
    "#6C71C4", -- Bright Magenta (Ansi 13)
    "#93A1A1", -- Bright Cyan (Ansi 14)
    "#FDF6E3", -- Bright White (Ansi 15)
  },

  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

-- Window settings
config.enable_wayland = false  -- Disable Wayland by default
config.window_padding = {
  left = 1,
  right = 1,
  top = 1,
  bottom = 1,
}

-- Cursor
config.cursor_blink_rate = 0
config.default_cursor_style = "BlinkingBlock"

-- Scrollback
config.scrollback_lines = 10000

-- Other settings
config.enable_tab_bar = true

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

-- and finally, return the configuration to wezterm
return config

