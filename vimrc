call plug#begin('~/.local/share/nvim/plugged')
" Languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'wokalski/autocomplete-flow'

" Other stuff
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-startify'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/echodoc.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'artur-shaik/vim-javacomplete2'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


" Themes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/landscape.vim'

call plug#end()

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_modified_removed = '•'

set completeopt-=preview
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

let g:startify_change_to_vcs_root = 1

" dont map C-h
let g:AutoPairsMapCh = 0
let g:JavaComplete_EnableDefaultMappings = 0

if has('nvim')
  autocmd TabNewEntered * Startify
else
  autocmd VimEnter * let t:startify_new_tab = 1
  autocmd BufEnter *
        \ if !exists('t:startify_new_tab') && empty(expand('%')) |
        \   let t:startify_new_tab = 1 |
        \   Startify |
        \ endif
endif

command Note :split ~/notes/notes.md

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
set signcolumn=yes
set updatetime=100
set tags=./tags;/

let g:netrw_banner = 0
let g:netrw_winsize = 20

" Line numbers
set number relativenumber

" Trailing
set listchars=trail:·
set list

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" SYNCING
map <leader>s :!~/bin/stage-sync<CR>

" fzf
map <leader>fb :Buffers<CR>
map <leader>ff :Files<CR>
map <leader>fl :Lines<CR>
map <leader>ft :Tags<cr>
map <leader>fr :History<cr>
map <leader>fh :Helptags<cr>
map <leader>f: :History:<cr>
map <leader>f/ :History/<cr>
map <leader>fg :GFiles<cr>
map <leader>fs :GFiles?<cr>
map <leader>fc :Commits<cr>

" TAB remap
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Toggles
nnoremap <leader>tt :TagbarToggle<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
" set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

set expandtab
set nobackup
set noswapfile
set ignorecase
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight clear SignColumn
highlight EndOfBuffer guifg=#202020
highlight Comment gui=italic cterm=italic
highlight Whitespace ctermbg=NONE ctermfg=grey guifg=grey guibg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight ALEErrorSign ctermbg=NONE ctermfg=red guifg=red guibg=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guifg=yellow guibg=NONE
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
lang en_US.UTF-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set splitbelow
set splitright

set noshowmode " Dont show mode

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffer nav
map <leader><Tab> :b#<cr>

" Tab nav
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Move to matches
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Resize pane with arrow keys
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Move cursor with C-hjkl in insert mode
inoremap <C-K> <C-o>gk
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-J> <C-o>gj
nnoremap / /\v

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Close the current buffer
map <leader>bd :Bclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and un-toggle spell checking

" Shortcuts using <leader>
" map <leader>ss :setlocal spell!<cr>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
" Paste from clipboard
vnoremap <leader>p "+p
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

fun! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType java setlocal omnifunc=javacomplete#Complete
