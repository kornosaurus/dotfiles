local opt = vim.opt
local indent = 4
-- local blend = 10

vim.g.mapleader = ' '

opt.guicursor = ""
opt.syntax = 'on'
opt.background = 'dark'
opt.termguicolors = true
opt.grepprg = 'rg --vimgrep --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,build,dist,*.vsdx,assets}"'
opt.grepformat = '%f:%l:%c:%m'
opt.completeopt = 'menu,menuone,noselect'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.updatetime = 100
opt.scrolloff = 7
opt.pumheight = 10
-- opt.pumblend = blend
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.lazyredraw = false
opt.cursorline = true
opt.undodir = os.getenv('HOME') .. '/.cache/undodir'
opt.inccommand = 'nosplit'
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
opt.listchars = 'tab:  ,trail:·'
opt.fillchars = 'eob: '
opt.mouse = 'a'
opt.number = false
opt.relativenumber = false
opt.wrap = false
opt.signcolumn = 'yes'
-- opt.winblend = blend
opt.list = true
opt.spelllang = 'en,sv'
opt.expandtab = true
opt.swapfile = false
opt.undofile = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true
opt.cmdheight = 0
opt.conceallevel = 3
opt.laststatus = 3
opt.guifont = { "Jetbrains Mono", ":h11" }
opt.diffopt:append({ "linematch:50", "iwhiteall", "algorithm:patience" })

vim.api.nvim_create_autocmd(
    { "BufWrite", "BufEnter", "InsertLeave" },
    {
        pattern = { "*" },
        callback = function()
            vim.diagnostic.setloclist({ open = false })
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "TextYankPost" },
    {
        pattern = { "*" },
        callback = function()
            vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 })
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = { "markdown", "gitcommit" },
        callback = function()
            vim.opt_local.spell = true
        end,
    }
)

-- Go to last cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd('WinLeave', {
    callback = function()
        vim.opt.cursorline = false
    end
})

vim.api.nvim_create_autocmd('WinEnter', {
    callback = function()
        vim.opt.cursorline = true
    end
})

vim.fn.sign_define(
    "DiagnosticSignError",
    { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
    "DiagnosticSignWarn",
    { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
    "DiagnosticSignHint",
    { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
)

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        vim.opt.cmdheight = 1
    end
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        vim.opt.cmdheight = 0
    end
})

local fn = vim.fn

function _G.qftf(info)
    local items
    local ret = {}
    -- The name of item in list is based on the directory of quickfix window.
    -- Change the directory for quickfix window make the name of item shorter.
    -- It's a good opportunity to change current directory in quickfixtextfunc :)
    --
    -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
    -- local root = getRootByAlterBufnr(alterBufnr)
    -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
    --
    if info.quickfix == 1 then
        items = fn.getqflist({ id = info.id, items = 0 }).items
    else
        items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
    end
    local limit = 31
    local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
    local validFmt = '%s │%5d:%-3d│%s %s'
    for i = info.start_idx, info.end_idx do
        local e = items[i]
        local fname = ''
        local str
        if e.valid == 1 then
            if e.bufnr > 0 then
                fname = fn.bufname(e.bufnr)
                if fname == '' then
                    fname = '[No Name]'
                else
                    fname = fname:gsub('^' .. vim.env.HOME, '~')
                end
                -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
                if #fname <= limit then
                    fname = fnameFmt1:format(fname)
                else
                    fname = fnameFmt2:format(fname:sub(1 - limit))
                end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
        else
            str = e.text
        end
        table.insert(ret, str)
    end
    return ret
end

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'
