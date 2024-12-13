local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- Font {{{
config.font_size = 13.37
-- Prefer Apple Color Emoji over Noto on iOS/macOS
if wezterm.target_triple:find('darwin') ~= nil then
  config.font = wezterm.font_with_fallback({
    {
      -- family = 'JetBrains Mono',
      family = 'JetBrainsMonoNL Nerd Font',
      style = 'Normal',
      weight = 'Regular',
      stretch = 'Normal',
    },
    {
      -- family = "Apple Color Emoji",
      family = 'Noto Color Emoji',
      assume_emoji_presentation = true,
      style = 'Normal',
      weight = 'Regular',
      stretch = 'Normal',
    },
  })
else
  config.font = wezterm.font('JetBrains Mono')
end

-- config.use_cap_height_to_scale_fallback_fonts = true
-- Disable ligatures
-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Fix emoji rendering
config.allow_square_glyphs_to_overflow_width = 'Always'
-- }}}

-- Appearance {{{
-- Tokyonight comes bundled with wezterm
config.color_scheme = 'tokyonight_night'

-- Translucent background
config.window_background_opacity = 0.80
config.macos_window_background_blur = 0
config.colors = {
  background = 'black',
  -- Make the selection text color fully transparent.
  -- When fully transparent, the current text color will be used.
  selection_fg = 'none',
  -- Set the selection backgrourd color with alpha.
  -- When selection_bg is transparent, it will be alpha blended over
  -- the current cell background color, rather than replace it
  selection_bg = 'rgba(50% 50% 50% 50%)',
}

config.cursor_blink_rate = 800
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
-- }}}

config.keys = {
  { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

wezterm.on('config_reload', function()
  wezterm.log('INFO', 'Configuration reloaded successfully!')
end)

-- and finally, return the configuration to wezterm
return config
