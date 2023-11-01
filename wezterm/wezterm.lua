local wezterm = require('wezterm')
-- local colors = require('lua/rose-pine-moon').colors()
-- local window_frame = require('lua/rose-pine-moon').window_frame()
local act = wezterm.action;

return {
    force_reverse_video_cursor = false,
    color_scheme = 'carbonfox',
    -- colors = colors,
    -- window_frame = window_frame,
    font = wezterm.font('Monolisa'),
    harfbuzz_features = { 'zero', 'ss01' },
    freetype_load_flags = 'NO_HINTING',
    font_size = 14,
    line_height = 1.3,
    initial_cols = 120,
    initial_rows = 32,

    -- Tab bar
    enable_tab_bar = false,
    tab_bar_at_bottom = false,
    window_decorations = "RESIZE",
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    -- colors = {
    --     tab_bar = {
    --         active_tab = {
    --             bg_color = '#313244',
    --             fg_color = '#cdd6f4'
    --         }
    --     }
    -- },

    -- Window
    window_padding = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2,
    },
    command_palette_font_size = 16,

    audible_bell = "Disabled",

    keys = {
        -- Splits
        { key = 's', mods = 'ALT|CTRL',  action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'v', mods = 'ALT|CTRL',  action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        -- { key = 'j', mods = 'ALT',       action = act.EmitEvent('ActivatePaneDirection-down') },
        -- { key = 'h', mods = 'ALT',       action = act.EmitEvent('ActivatePaneDirection-left') },
        -- { key = 'k', mods = 'ALT',       action = act.EmitEvent('ActivatePaneDirection-up') },
        -- { key = 'l', mods = 'ALT',       action = act.EmitEvent('ActivatePaneDirection-right') },
        { key = 'q', mods = 'SHIFT|ALT', action = act.CloseCurrentPane({ confirm = true }) },

        -- Panes
        { key = '{', mods = 'SHIFT|ALT', action = act.MoveTabRelative(-1) },
        { key = '}', mods = 'SHIFT|ALT', action = act.MoveTabRelative(1) },
    }
}
