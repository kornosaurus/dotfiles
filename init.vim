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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter'

" Git
Plug 'tpope/vim-fugitive'

" Efficiency
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'

" Other
Plug 'skywind3000/asyncrun.vim'
Plug 'voldikss/vim-floaterm'

" Colors
Plug 'ayu-theme/ayu-vim'
call plug#end()
" }}}

" {{{ Colors
syntax enable
set termguicolors
set background=dark
let g:gruvbox_contrast_dark="hard"
let ayucolor="dark"

colorscheme ayu

highlight SignColumn ctermbg=NONE guibg=NONE
highlight DiffAdd guibg=NONE
highlight DiffChange guibg=NONE
highlight DiffDelete guibg=NONE guifg=#FF3333
highlight Error guibg=NONE
highlight Comment gui=italic
highlight StatusLine guibg=NONE gui=NONE
highlight Type gui=bold
" }}}

" {{{ Options
let g:coc_global_extensions=[ 'coc-tsserver', 'coc-git', 'coc-json', 'coc-css' ]

let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = [
            \ '    ________  ___  __       ',
            \ '   |\   ____\|\  \|\  \     ',
            \ '   \ \  \___|\ \  \/  /|_   ',
            \ '    \ \_____  \ \   ___  \  ',
            \ '     \|____|\  \ \  \\ \  \ ',
            \ '       ____\_\  \ \__\\ \__\',
            \ '      |\_________\|__| \|__|',
            \ '      \|_________|          '
            \ ]


let $FZF_DEFAULT_OPTS = '--layout=reverse'

let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.8 } }
let g:fzf_branch_actions = {
            \ 'create': {'keymap': 'alt-n'},
            \}

let g:coc_fzf_opts = []

let g:floaterm_autoclose=2
let g:floaterm_title=""
let g:floaterm_height=0.8

let g:EclimJavaCompleteCaseSensitive = 1

let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]

set foldmethod=marker
set foldlevelstart=99

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

set completeopt-=preview

set signcolumn=yes

set updatetime=100

set nowrap

let g:netrw_banner = 0

set number
set relativenumber

set cursorline

" make vimdiff not readonly
set noro 

set diffopt+=vertical

filetype plugin on
filetype indent on

set shortmess+=c

set conceallevel=0

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

set hlsearch
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

set wrap

" set lcs=tab:▸\ ,eol:↴,trail:·
set lcs=tab:\ \ ,trail:·
set list

set statusline=""
set statusline+=\ %t
set statusline+=%m
set statusline+=\ [%{get(g:,'coc_git_status','')}]
set statusline+=%=
set statusline+=[%{coc#status()}%{get(b:,'coc_current_function','')}]
set statusline+=\ %y
set statusline+=\ [%l/%L]
" }}}

" {{{ Mappings
command! Bd bp|bd #
nnoremap <leader><CR> :noh<CR>

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>bd :Bd<CR>

nnoremap <leader>/ :grep<space>

" Move selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>fb :FzfBuffers<CR>
nnoremap <leader>fl :FzfLines<CR>

" git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap <leader>gl :Git log -100<CR>
nnoremap <leader>dh :diffget //2<CR>
nnoremap <leader>dl :diffget //3<CR>

nnoremap <leader>e :FloatermNew nnn<CR>
nnoremap <leader>lg :FloatermNew lazygit<CR>
nnoremap <leader>fi :FloatermNew idfind<CR>

nnoremap / /\v

nnoremap Y "+y
vnoremap Y "+y

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

inoremap <expr><C-n> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><c-space> coc#refresh()

vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

let g:vimwiki_table_mappings = 0

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" go to
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)

" show
nmap <silent>gh :call CocAction('doHover')<CR>
nmap <silent><C-h> :call CocActionAsync('showSignatureHelp')<CR>
imap <silent><C-h> <Esc>:call CocActionAsync('showSignatureHelp')<CR>a

" list
nmap <silent><leader>o :CocFzfList outline<cr>
nmap <silent><leader>d :CocFzfList diagnostics<cr>
nmap <silent><leader>r :CocFzfListResume<CR>

" actions
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

nnoremap <leader>- :Scratch<CR>

" repl
nnoremap ro :Repl 
nnoremap rr :FloatermSend<CR>
vnoremap rr :FloatermSend<CR>
nnoremap rR ggVG:FloatermSend<CR><C-o>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " autocmd CursorHold * silent call CocActionAsync('highlight')

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

    " java
    au FileType java inoremap <buffer><silent><c-space> <C-x><C-u>
    au FileType java inoremap <buffer><silent><expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"
    au FileType java inoremap <buffer><silent><expr><C-p> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"
    au FileType java nnoremap <buffer>gr :JavaSearch -x references<CR>
    au FileType java nnoremap <buffer>gd :JavaSearch -a edit<CR>
    au FileType java nnoremap <buffer>gD :JavaSearch -x implementors -a edit<CR>
    au FileType java nnoremap <buffer>gs :JavaSearch -a vsplit<CR>
    au FileType java nnoremap <buffer>gi :JavaImport<CR>
    au FileType java nnoremap <buffer>gh :JavaDocPreview<CR>
    au FileType java nnoremap <leader>rn :JavaRename 
    au FileType java nnoremap <leader>ca :JavaCorrect<CR>


    " Auto reload init.vim
    au BufWritePost */init.vim source $MYVIMRC
augroup END

source ~/.config/nvim/work.init.vim

" Tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    }
}
EOF
" }}}
