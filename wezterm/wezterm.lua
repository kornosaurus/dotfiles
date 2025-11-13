local wezterm = require('wezterm')
-- local colors = require('lua/rose-pine').colors()
-- local window_frame = require('lua/rose-pine').window_frame()
local act = wezterm.action;

return {
  -- force_reverse_video_cursor = false,
  color_scheme = 'duckbones',
  default_domain = 'WSL:Ubuntu',

  colors = {
    tab_bar = {
      inactive_tab_edge = '#575757',
      active_tab = {
        bg_color = '#0E101A',
        fg_color = '#EBEFC0'
      },
      inactive_tab = {
        bg_color = '#0E101A',
        fg_color = '#808080',
      },
      inactive_tab_hover = {
        bg_color = '#0E101A',
        fg_color = '#808080',
      },
      new_tab = {
        bg_color = '#0E101A',
        fg_color = '#808080',
      },
      new_tab_hover = {
        bg_color = '#0E101A',
        fg_color = '#808080',
      },
    }
  },
  window_frame = {
    active_titlebar_bg = '#0E101A',
    inactive_titlebar_bg = '#0E101A',
  },

  -- colors = colors,
  -- window_frame = window_frame,

  font = wezterm.font('MonoLisa'),
  harfbuzz_features = {
    'zero',
    'ss01',
    'ss08',
    -- 'ss02', -- script italic
    'ss11',
    'ss04',
    'ss07'
  },
  freetype_load_flags = 'NO_HINTING',
  font_size = 10.5,
  line_height = 1,
  initial_cols = 120,
  initial_rows = 32,

  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },

  -- Tab bar
  enable_tab_bar = true,
  tab_bar_at_bottom = false,
  window_decorations = "RESIZE",
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,

  -- Window
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },
  command_palette_font_size = 16,

  audible_bell = "Disabled",

  front_end = "WebGpu",
  max_fps = 144,

  keys = {
    -- Splits
    { key = 's', mods = 'SHIFT|ALT',  action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'v', mods = 'SHIFT|ALT',  action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'j', mods = 'SHIFT|ALT',  action = act.ActivatePaneDirection('Down') },
    { key = 'h', mods = 'SHIFT|ALT',  action = act.ActivatePaneDirection('Left') },
    { key = 'k', mods = 'SHIFT|ALT',  action = act.ActivatePaneDirection('Up') },
    { key = 'l', mods = 'SHIFT|ALT',  action = act.ActivatePaneDirection('Right') },
    { key = 'q', mods = 'SHIFT|ALT', action = act.CloseCurrentPane({ confirm = true }) },

    -- Panes
    { key = '[', mods = 'SHIFT|ALT', action = act.MoveTabRelative(-1) },
    { key = ']', mods = 'SHIFT|ALT', action = act.MoveTabRelative(1) },

    {key="o", mods="SHIFT|ALT",
      action=wezterm.action{QuickSelectArgs={
        patterns={
          "https?://\\S+"
        },
        action = wezterm.action_callback(function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info("opening: " .. url)
          wezterm.open_with(url)
        end)
      }}
    },
  }
}
