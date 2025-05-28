local opt = vim.opt
local indent = 2
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
opt.winborder = 'single'
opt.list = true
opt.spelllang = 'en'
opt.expandtab = true
opt.swapfile = false
opt.undofile = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true
opt.cmdheight = 0
opt.conceallevel = 3
opt.laststatus = 3
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

local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h") or ""
end

vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        vim.api.nvim_set_current_dir(get_git_root())
    end
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

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        },
    }
})

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
