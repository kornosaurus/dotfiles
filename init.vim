"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         PLUG                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'HerringtonDarkholme/yats.vim'
Plug 'calviken/vim-gdscript3'
Plug 'starcraftman/vim-eclim'
Plug 'racer-rust/vim-racer'

Plug 'Shougo/echodoc.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug '/home/simonk/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'dracula/vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                       COLORS                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set termguicolors
set background=dark

colorscheme dracula

highlight EndOfBuffer guifg=grey
highlight Comment gui=italic cterm=italic
highlight Whitespace ctermbg=NONE ctermfg=grey guifg=#282726 guibg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE guifg=grey
highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight ALEErrorSign ctermbg=NONE ctermfg=red guifg=red guibg=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guifg=yellow guibg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         OPTIONS                           "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [ 
            \ {'c': '~/.config/nvim/init.vim' },
            \ {'z': '~/.zshrc'                },
            \ {'a': '~/.alacritty.yml'        },
            \ {'i': '~/.config/i3/config'     },
            \ ]

let g:fzf_command_prefix = 'Fzf'

set foldmethod=syntax
set foldlevelstart=20

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

let g:nvim_typescript#max_completion_detail=100
let g:nvim_typescript#javascript_support=1
let g:nvim_typescript#server_path='/usr/local/bin/tsserver'

let g:racer_cmd = "/home/simonk/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:startify_change_to_vcs_root = 1

set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#min_pattern_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.typescript = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.typescriptreact = '[^. *\t]\.\w*'

let g:EclimCompletionMethod = 'omnifunc'
let g:EclimJavaSearchSingleResult = 'edit'

let g:echodoc_enable_at_startup = 1

" Disable default snippet
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }

let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_completed_snippet=1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'java': [],
\   'rust': ['cargo'],
\}

let g:ale_linter_aliases = {
\   'typescriptreact': 'typescript'
\ }

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

set signcolumn=yes
set updatetime=100

set wrap

let g:netrw_banner = 0
let g:netrw_winsize = 20

" Line numbers
set number relativenumber

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" cursor line
set cursorline

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

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

" clipboard
set clipboard=unnamedplus

" Save undo state
set undodir=~/.vim/undodir
set undofile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
lang en_US.UTF-8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Live substitute
set inccommand=nosplit

""""" STATUSLINE
" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ', 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

set statusline=
set statusline+=\ %{ModeCurrent()}
set statusline+=\ ‹‹
set statusline+=\ %t
set statusline+=\ ››
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %{LinterStatus()}
set statusline+=%y
set statusline+=\ ‹‹
set statusline+=\ %p%%
set statusline+=\ ››\ %*

set laststatus=2
    
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

set splitbelow
set splitright

set noshowmode " Dont show mode

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" grep
nnoremap <leader>/ :grep! 

inoremap <expr> <Tab>    pumvisible() ? "\<C-n>" :  "\<Tab>"
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-n>    pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         AUTOCMDS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cant debug this now but something clears SignColumn, cant be found with :verbose
au BufEnter * highlight GitGutterAdd guifg=lightgreen | highlight GitGutterDelete guifg=red | highlight GitGutterChange guifg=yellow | highlight GitGutterChangeDelete guifg=red

" Language bindings
au Filetype java nmap gd :JavaSearchContext<CR>
au Filetype java nmap gs :JavaSearchContext -a split<CR>
au Filetype java nmap gv :JavaSearchContext -a vsplit<CR>
au Filetype java nmap gp :JavaDocPreview<CR>
au Filetype java nmap <leader>gd :JavaDocSearch -x declarations<CR>
au Filetype java nmap <leader>i :JavaImport<CR>

au Filetype javascript,typescript,typescriptreact nmap gd :TSDef<CR>
au Filetype javascript,typescript,typescriptreact nmap gs :TSDefPreview<CR>
au Filetype javascript,typescript,typescriptreact nmap gp :TSType<CR>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gv <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" indentation
au Filetype * setlocal expandtab
au Filetype java setlocal noexpandtab

if exists('g:gui_oni')
    " Enable GUI mouse behavior
    set mouse=a
endif
