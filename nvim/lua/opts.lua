local opt = vim.opt
local indent = 4
-- local blend = 10

vim.g.mapleader = ' '

opt.guicursor = ""
opt.syntax = 'on'
opt.background = 'dark'
opt.termguicolors = true
opt.grepprg = 'rg --vimgrep'
opt.grepformat = '%f:%l:%c:%m'
opt.completeopt = 'menu,menuone,noselect'
opt.foldlevelstart = 99
opt.updatetime = 100
opt.scrolloff = 7
opt.pumheight = 20
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
opt.fillchars = 'vert:│,eob: '
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
opt.cmdheight = 1
opt.conceallevel = 3
opt.laststatus = 3
opt.guifont = { "Jetbrains Mono", ":h11" }
opt.diffopt:append({"linematch:50"})

vim.g.netrw_banner = 0

vim.api.nvim_create_autocmd(
    {"BufWritePre"},
    {
        pattern = {"*/flamingo/*", "*/genial/*"},
        callback = function()
            vim.lsp.buf.format({timeout=1000})
        end,
    }
)

vim.api.nvim_create_autocmd(
    {"BufWrite","BufEnter","InsertLeave"},
    {
        pattern = {"*"},
        callback = function()
            vim.diagnostic.setloclist({open = false})
        end,
    }
)

vim.api.nvim_create_autocmd(
    {"TextYankPost"},
    {
        pattern = {"*"},
        callback = function()
            vim.highlight.on_yank({ higroup='IncSearch', timeout=100 })
        end,
    }
)

vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern = {"markdown", "gitcommit"},
        callback = function()
            vim.opt_local.spell = true
        end,
    }
)

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
