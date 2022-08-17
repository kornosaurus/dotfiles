local opt = vim.opt
local cmd = vim.cmd
local indent = 4
local blend = 10

opt.syntax = 'on'
opt.background = 'dark'
opt.termguicolors = true
opt.grepprg = 'rg --vimgrep'
opt.grepformat = '%f:%l:%c:%m'
opt.completeopt = 'menu,menuone,noinsert,noselect'
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
opt.winblend = blend
opt.list = true
opt.spelllang = 'en,sv'
opt.expandtab = true
opt.swapfile = false
opt.undofile = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true
opt.conceallevel = 3
opt.laststatus = 3
opt.guifont = { "Jetbrains Mono", ":h11" }

vim.g.netrw_banner = 0

if vim.g.neovide then
    vim.g.neovide_floating_blur_amount_x = 4.0
    vim.g.neovide_floating_blur_amount_y = 4.0
end

--local format = function() vim.lsp.buf.formatting_sync(nil, 1000) end
cmd [[autocmd BufWritePre */flamingo/* lua vim.lsp.buf.format({timeout=1000})]]
--vim.api.nvim_create_autocmd({"BufWritePre"}, {
--  pattern = {"*/flamingo/*"},
--  callback = function() vim.lsp.buf.formatting_sync(nil, 1000) end,
--})
--

cmd [[autocmd BufWrite,BufEnter,InsertLeave * lua vim.diagnostic.setloclist({open = false})]]
cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }]]
--vim.api.nvim_create_autocmd({"TextYankPost"}, {
--  pattern = {"*"},
--  callback = function() vim.highlight.on_yank({ higroup='IncSearch', timeout=100 }) end,
--})
cmd [[autocmd FileType markdown,gitcommit setlocal spell]]
