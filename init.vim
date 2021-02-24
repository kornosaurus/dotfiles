"    ________  ___  __
"   |\   ____\|\  \|\  \
"   \ \  \___|\ \  \/  /|_
"    \ \_____  \ \   ___  \
"     \|____|\  \ \  \\ \  \
"       ____\_\  \ \__\\ \__\
"      |\_________\|__| \|__|
"      \|_________|

" {{{ Plug
call plug#begin('~/.local/share/nvim/plugged')
" Fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Language features
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'puremourning/vimspector'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Efficiency
Plug 'tpope/vim-surround'
Plug 'rstacruz/vim-closer'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'terrortylor/nvim-comment'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'

" Other
Plug 'skywind3000/asyncrun.vim'
Plug 'voldikss/vim-floaterm'
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}

" Colors
Plug 'ayu-theme/ayu-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
call plug#end()
" }}}

" {{{ Colors
syntax enable
set termguicolors
set background=dark

colorscheme spaceduck

" spaceduck additions
highlight NonText guifg=#1b1c36
highlight StatusLineNC guifg=#1b1c36 guibg=#0f111b
highlight StatusLine guifg=#1b1c36 guibg=#ecf0c1
highlight VertSplit guifg=#1b1c36 guibg=#0f111b

highlight SignColumn ctermbg=NONE guibg=NONE
highlight DiffAdd guibg=NONE
highlight DiffChange guibg=NONE
highlight DiffDelete guibg=NONE guifg=#FF3333
highlight Error guibg=NONE
highlight Comment gui=italic
highlight Type gui=bold
" }}}

" {{{ Options
let g:vimsyn_embed = 'lPr'
let g:completion_enable_auto_popup = 0
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_ignore_case=0
let g:completion_confirm_key = "\<C-y>"
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'},
\]

let g:floaterm_autoclose=2
let g:floaterm_title=""
let g:floaterm_height=0.8

let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:indentLine_char = '▏'
let g:indent_blankline_char = '▏'

set foldmethod=marker
set foldlevelstart=99

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

set completeopt=menuone,noinsert,noselect

set signcolumn=yes

set updatetime=100

set nowrap

let g:netrw_banner = 0

set number
set relativenumber

" set cursorline

set guicursor=

set spelllang=en,sv

" make vimdiff not readonly
set noro 

set diffopt+=vertical

filetype plugin on
filetype indent on

set shortmess+=c

set autoread

let mapleader = " "
let g:mapleader = " "

set mouse=a

set so=7

set emoji
set wildmenu
set wildoptions=pum
set pumheight=20
set pumblend=10
set winblend=10

set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set cmdheight=1
set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set nohlsearch
set expandtab
set nobackup
set noswapfile
set ignorecase
set smartcase

" Makes search act like search in modern browsers
set incsearch
set lazyredraw
set magic
set showmatch

" Save undo state
set undodir=~/.vim/undodir
set undofile

" Live substitute
set inccommand=nosplit

set laststatus=2
set smarttab

set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

set splitbelow
set splitright

set noshowmode

set nowrap

" set lcs=tab:▸\ ,eol:↴,trail:·
set lcs=tab:\ \ ,trail:·
set list

function GitBranch()
    let branch = FugitiveHead()

    if !empty(branch)
        return "󰘬 " . branch
    endif
    return ""
    " return \ 󰘬\ %{GitBranch()}
endfunction

function Unsaved()
    if &mod == 1
        return " 󰜄 "
    endif
    return ""
endfunction

set statusline=""
set statusline+=%f
set statusline+=%{Unsaved()}
set statusline+=%=
set statusline+=\ %{GitBranch()}
set statusline+=\ %l/%L
" }}}

" {{{ Mappings
command! Bd bp|bd #

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>bd :Bd<CR>

nnoremap <leader>/ :grep<space>

" nnoremap <leader>ff :FzfFiles<CR>
" nnoremap <leader>fb :FzfBuffers<CR>
" nnoremap <leader>fl :FzfLines<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>

" git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap <leader>gl :Git log -100<CR>
nnoremap <leader>dh :diffget //2<CR>
nnoremap <leader>dl :diffget //3<CR>

nnoremap <leader>e :FloatermNew vifm<CR>
nnoremap <leader>lg :FloatermNew lazygit<CR>
nnoremap <leader>fi :FloatermNew idfind<CR>

nnoremap / /\v

nnoremap Y "+y
vnoremap Y "+y

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

imap <silent> <C-n> <Plug>(completion_trigger)
imap <silent> <C-p> <Plug>(completion_trigger)

vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

let g:vimwiki_table_mappings = 0

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

nnoremap <leader>- :Scratch<CR>

" repl
nnoremap <leader>ro :Repl 
nnoremap <leader>rr :FloatermSend<CR>
vnoremap <leader>rr :FloatermSend<CR>
nnoremap <leader>rR ggVG:FloatermSend<CR><C-o>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Vimspector
"nmap <leader>dc <Plug>VimspectorContinue
"nmap <leader>ds <Plug>VimspectorStop
"nmap <leader>dr <Plug>VimspectorRestart
"nmap <leader>dR :VimspectorReset<CR>
"nmap <leader>dp <Plug>VimspectorPause
"nmap <leader>db <Plug>VimspectorToggleBreakpoint
"nmap <leader>dB <Plug>VimspectorToggleConditionalBreakpoint
"nmap <F10> <Plug>VimspectorStepOver
"nmap <F11> <Plug>VimspectorStepInto
"nmap <F12> <Plug>VimspectorStepOut
"nmap <leader><F10> <Plug>VimspectorRunToCursor
"

" }}}

" {{{ Commands
command! ArduinoCompile execute "AsyncRun -raw arduino-cli compile -b arduino:avr:uno" <bar> copen 10 <bar> wincmd p
command! ArduinoUpload execute "AsyncRun -raw arduino-cli upload -b arduino:avr:uno -p /dev/ttyACM0" <bar> copen 10 <bar> wincmd p
command! -nargs=1 ArduinoMonitor split <bar> resize -10 <bar> execute "term screen /dev/ttyACM0 <args>" <bar> wincmd p <ESC>

" Open scratch buffer
command! Scratch enew | setlocal buftype=nofile | setlocal bufhidden=hide | setlocal noswapfile

" Repl
command! -nargs=1 Repl execute "FloatermNew --name=repl --width=0.3 --position=right --wintype=normal <args>" <bar> wincmd p <bar> call feedkeys("\<ESC>")
" }}}

" {{{ Autocommands
augroup autocommands
    autocmd!
    " Restore last cursor position and marks on open
    au BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
                \ |   exe "normal! g`\""
                \ | endif

    autocmd TermOpen * startinsert " Terminal start in insertmode

    au FileType fzf set nonu nornu

    au FileType vim set foldlevel=0

    autocmd BufEnter * lua require'completion'.on_attach()

    " filetypes
    au BufRead,BufNewFile *.sls set filetype=yaml
    au BufRead,BufNewFile *.trans set filetype=translations
    au BufRead,BufNewFile Jenkinsfile set ft=groovy

    " Indentation
    au BufEnter * setlocal expandtab
    au BufEnter * setlocal shiftwidth=4
    au BufEnter * setlocal tabstop=4
    au BufEnter *.java setlocal noexpandtab
    au BufEnter *.sls setlocal shiftwidth=2
    au BufEnter *.sls setlocal tabstop=2
    au BufEnter *.yml setlocal shiftwidth=2
    au BufEnter *.yml setlocal tabstop=2
    au BufEnter *.md setlocal shiftwidth=2
    au BufEnter *.md setlocal tabstop=2

    " Spelling
    au FileType markdown setlocal spell
    au FileType vimwiki setlocal spell
    au FileType translations setlocal spell
    au FileType gitcommit setlocal spell


    " Auto reload init.vim
    au BufWritePost */init.vim source $MYVIMRC
augroup END
" }}}

" {{{ LUA
" Tree sitter
lua <<EOF
require('nvim_comment').setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    }
}

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require'completion'.on_attach()

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead guibg=#16172d
      hi LspReferenceText guibg=#16172d
      hi LspReferenceWrite guibg=#16172d
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/simon/Programs/omnisharp/run"
require'lspconfig'.omnisharp.setup{
    on_attach = on_attach,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}

require "lspconfig".efm.setup {
    settings = {
        rootMarkers = {".eslintrc.json"},
        languages = {}
    }
}

EOF
" }}}
