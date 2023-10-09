local wezterm = require('wezterm')
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()
local act = wezterm.action;

local function isViProcess(pane)
    -- get_foreground_process_name On Linux, macOS and Windows, 
    -- the process can be queried to determine this path. Other operating systems 
    -- (notably, FreeBSD and other unix systems) are not currently supported
    return pane:get_foreground_process_name():find('n?vim') ~= nil
    -- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if isViProcess(pane) then
        window:perform_action(
            -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = 'ALT' }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

return {
    force_reverse_video_cursor = true,
    -- color_scheme = 'github_dark_dimmed',
    colors = colors,
    window_frame = window_frame,
    font = wezterm.font('Jetbrains Mono'),
    font_size = 15,
    line_height = 1.2,

    -- Tab bar
    tab_bar_at_bottom = false,
    window_decorations = "RESIZE",
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

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
        { key = 's', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
        { key = 'v', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
        { key = 'j', mods = 'ALT', action = act.EmitEvent('ActivatePaneDirection-down') },
        { key = 'h', mods = 'ALT', action = act.EmitEvent('ActivatePaneDirection-left') },
        { key = 'k', mods = 'ALT', action = act.EmitEvent('ActivatePaneDirection-up') },
        { key = 'l', mods = 'ALT', action = act.EmitEvent('ActivatePaneDirection-right') },
        { key = 'q', mods = 'SHIFT|ALT', action = act.CloseCurrentPane({ confirm = true }) },

        -- Panes
        { key = '{', mods = 'SHIFT|ALT', action = act.MoveTabRelative(-1) },
        { key = '}', mods = 'SHIFT|ALT', action = act.MoveTabRelative(1) },
    }
}

