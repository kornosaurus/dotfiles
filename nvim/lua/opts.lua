local indent = 4
local blend = 10

-- global options
vim.o.syntax = "on"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.cmd [[ silent! colorscheme nightfly ]]

vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.foldlevelstart = 99
vim.o.updatetime = 100
vim.o.scrolloff = 7
vim.o.pumheight = 20
vim.o.pumblend = blend
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.lazyredraw = true
-- vim.o.undodir = "~/.cache/undodir" -- FIXME
vim.o.inccommand = "nosplit" -- Live substitute
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.listchars = "tab:  ,trail:·"
vim.o.guicursor = ""
vim.o.mouse = "a"

-- window-local options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.wo.winblend = blend
vim.wo.list = true

-- buffer-local options
vim.bo.spelllang = "en,sv"
vim.bo.expandtab = true
vim.bo.swapfile = false
vim.bo.undofile = true
vim.bo.shiftwidth = indent
vim.bo.tabstop = indent
vim.bo.smartindent = true
