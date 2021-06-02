local gl = require('galaxyline')
local utils = require('utils')

local gls = gl.section
gl.short_line_list = { 'packager' }

-- Colors
local colors = {
    bg = '#080808',
    fg = '#b2b2b2',
    section_bg = '#1c1c1c',
    yellow = '#f1fa8c',
    cyan = '#8be9fd',
    green = '#50fa7b',
    orange = '#ffb86c',
    magenta = '#ff79c6',
    blue = '#8be9fd',
    red = '#ff5555'
}

-- Local helper functions
local buffer_not_empty = function()
    return not utils.is_buffer_empty()
end

local checkwidth = function()
    return utils.has_width_gt(40) and buffer_not_empty()
end

local mode_color = function()
    local mode_colors = {
        n = colors.cyan,
        i = colors.green,
        c = colors.orange,
        t = colors.orange,
        S = colors.magenta,
        s = colors.magenta,
        V = colors.magenta,
        [''] = colors.magenta,
        v = colors.magenta,
        R = colors.red,
    }

    return mode_colors[vim.fn.mode()]
end

-- Left side
gls.left[1] = {
    FirstElement = {
        provider = function() return '▋' end,
        highlight = { colors.cyan, colors.bg }
    },
}
gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                t = 'TERMINAL',
                S = 'SELECT',
                s = 'SELECT',
                V = 'VISUAL',
                [''] = 'VISUAL',
                v = 'VISUAL',
                R = 'REPLACE',
            }
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
            return alias[vim.fn.mode()]..' '
        end,
        highlight = { colors.bg, colors.bg },
        separator = "  ",
        separator_highlight = {colors.bg, colors.section_bg},
    },
}
gls.left[3] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    },
}
gls.left[4] = {
    FileName = {
        provider = 'FileName',
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.section_bg },
        separator = " ",
        separator_highlight = {colors.section_bg, colors.bg},
    }
}
gls.left[5] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = buffer_not_empty,
        highlight = {colors.red,colors.bg},
    }
}
gls.left[6] = {
    GitBranch = {
        provider = function()
            local vcs = require('galaxyline.provider_vcs')
            local branch_name = vcs.get_git_branch()
            if (branch_name == nil) then
                return " "
            end
            if (string.len(branch_name) > 28) then
                return string.sub(branch_name, 1, 25).."..."
            end
            return branch_name .. " "
        end,
        condition = buffer_not_empty,
        highlight = {colors.fg,colors.bg},
    }
}
gls.left[7] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = ' ',
        highlight = { colors.green, colors.bg },
    }
}
gls.left[8] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' ',
        highlight = { colors.orange, colors.bg },
    }
}
gls.left[9] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = ' ',
        highlight = { colors.red,colors.bg },
    }
}
gls.left[10] = {
    LeftEnd = {
        provider = function() return '  ' end,
        condition = buffer_not_empty,
        highlight = {colors.bg,colors.section_bg}
    }
}
gls.left[11] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.section_bg}
    }
}
gls.left[12] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.orange,colors.section_bg},
    }
}
gls.left[13] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.section_bg},
        separator = ' ',
        separator_highlight = { colors.section_bg, colors.bg },
    }
}

-- Right side
gls.right[1]= {
    FileFormat = {
        provider = function() return vim.bo.filetype end,
        highlight = { colors.fg,colors.section_bg },
        separator = '  ',
        separator_highlight = { colors.bg,colors.section_bg },
    }
}
gls.right[2] = {
    LinePercent = {
        provider = 'LinePercent',
        highlight = { colors.fg, colors.section_bg },
        separator = ' |',
        separator_highlight = { colors.bg, colors.section_bg },
    },
}
gls.right[3] = {
    RightEnd = {
        provider = function() return ' ' end,
        condition = buffer_not_empty,
        highlight = {colors.section_bg, colors.bg}
    }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
