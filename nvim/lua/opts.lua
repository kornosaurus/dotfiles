local opt = vim.opt
local indent = 4
local blend = 10

opt.syntax = 'on'
opt.background = 'dark'
opt.termguicolors = true
opt.grepprg = 'rg --vimgrep'
opt.grepformat = '%f:%l:%c:%m'
opt.completeopt = 'menuone,noinsert,noselect'
opt.foldlevelstart = 99
opt.updatetime = 100
opt.scrolloff = 7
opt.pumheight = 20
opt.pumblend = blend
opt.hidden = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.lazyredraw = true
opt.undodir = os.getenv('HOME') .. '/.cache/undodir'
opt.inccommand = 'nosplit'
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
opt.listchars = 'tab:  ,trail:·'
opt.fillchars = 'vert:│,eob: '
opt.mouse = 'a'
opt.guifont = 'Iosevka Nerd Font:h15'
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.winblend = blend
opt.list = true
opt.spelllang = 'en,sv'
opt.expandtab = true
opt.swapfile = false
opt.undofile = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true
