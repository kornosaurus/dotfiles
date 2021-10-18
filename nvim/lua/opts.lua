local opt = vim.opt
local cmd = vim.cmd
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
opt.cursorline = false
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
opt.winblend = blend
opt.list = true
opt.spelllang = 'en,sv'
opt.expandtab = true
opt.swapfile = false
opt.undofile = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true

vim.g.netrw_banner = 0

cmd [[autocmd BufWritePre */flamingo/* lua vim.lsp.buf.formatting_sync(nil, 1000)]]
cmd [[autocmd BufWrite,BufEnter,InsertLeave * lua vim.lsp.diagnostic.set_loclist({open = false})]]
cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }]]
cmd [[autocmd FileType markdown,gitcommit setlocal spell]]
