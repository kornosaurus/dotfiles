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
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sbdchd/neoformat'

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

" Colors
Plug 'ayu-theme/ayu-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()
" }}}

" {{{ Colors
syntax enable
set termguicolors
set background=dark

colorscheme nightfly

" spaceduck
" highlight VertSplit    guibg=#0f111b guifg=#1b1c36
" highlight StatusLineNC guifg=#0f111b
" highlight StatusLine   guifg=#0f111b

" nightify
highlight StatusLine   guibg=#001323
highlight StatusLineNC guibg=#00111f

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

let g:compe = {}
let g:compe.autocomplete = v:false
let g:compe.enabled = v:true
let g:compe.source = {
\ 'path': v:true,
\ 'buffer': v:true,
\ 'nvim_lsp': v:true,
\ }

let g:floaterm_autoclose=2
let g:floaterm_title=""
let g:floaterm_height=0.8

let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]

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
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

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

nnoremap <C-q> :copen<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
nnoremap <leader>q :lopen<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprev<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-y>     compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

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

nnoremap <leader>rt :Test %<CR>
nnoremap <leader>rl :Lint<CR>

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

command! -nargs=* Test execute "AsyncRun npm run test -- -i <args>" <bar> copen 10 <bar> wincmd p
command! Lint execute "AsyncRun eslint_d %" <bar> copen 10 <bar> wincmd p

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

    au BufWrite,BufEnter,InsertLeave * lua vim.lsp.diagnostic.set_loclist({open_loclist = false})

augroup END
" }}}

lua << EOF
require('init') -- TODO: Remove when configuration is fully moved to lua
EOF
