"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         PLUG                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'calviken/vim-gdscript3'

Plug 'ap/vim-css-color'
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
Plug 'HerringtonDarkholme/yats.vim'
Plug 'starcraftman/vim-eclim'
Plug 'racer-rust/vim-racer'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'dracula/vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'dylanaraps/wal.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                       COLORS                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

" set termguicolors
set background=dark

colorscheme wal

highlight EndOfBuffer guifg=grey
highlight Comment guifg=#5C6370
highlight StatusLine guibg=NONE ctermbg=NONE
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
let g:deoplete#min_pattern_length = 2
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#disable_auto_complete = 1

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

let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_modified_removed = '•'

set signcolumn=yes
set updatetime=100

set wrap

let g:netrw_banner = 0

set number relativenumber

filetype plugin on
filetype indent on

set autoread

let mapleader = " "
let g:mapleader = " "

set so=7

set wildmenu

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

" tsx bugged, needs typescript loaded before going to tsx, easy fix below
set filetype=typescript

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
    
set smarttab

set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

set splitbelow
set splitright

set noshowmode 

" yats needs to initialize for tsx files to be correctly highlighted if you
" enter a tsx file before a ts file.
" set filetype=typescript

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><CR> :noh<CR>
nnoremap <leader><Tab> :b#<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <leader>tn :tabnew <CR>
noremap <silent> <leader>t<Tab> :tabnext <CR>
noremap <silent> <leader>t<S-Tab> :tabprevious <CR>

noremap <silent> <leader>sv :vsplit new <CR>
noremap <silent> <leader>sh :split new <CR>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" fzf
nnoremap <leader>fb :FzfBuffers<CR>
nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>fl :FzfLines<CR>
nnoremap <leader>ft :FzfTags<cr>
nnoremap <leader>fr :FzfHistory<cr>
nnoremap <leader>fh :FzfHelptags<cr>
nnoremap <leader>fm :FzfMarks<cr>
nnoremap <leader>f: :FzfHistory:<cr>
nnoremap <leader>f/ :FzfHistory/<cr>
nnoremap <leader>fg :FzfGFiles<cr>
nnoremap <leader>fs :FzfGFiles?<cr>
nnoremap <leader>fc :FzfCommits<cr>

nnoremap / /\v
" grep
nnoremap <leader>/ :grep! 

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" :  "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

imap <C-e> <Plug>(neosnippet_expand_or_jump)
smap <C-e> <Plug>(neosnippet_expand_or_jump)
xmap <C-e> <Plug>(neosnippet_expand_target)

" sessions
nnoremap <leader>ss :mks! ~/.vim/session/
nnoremap <leader>so :source ~/.vim/session/
nnoremap <leader>sd :!rm ~/.vim/session/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         AUTOCMDS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup autocommands
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
    au BufRead, BufEnter .tsx set filetype=typescript | set filetype=typescriptreact " some hightlights doesnt transfer to typescriptreact

    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gv <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)

    " indentation
    au Filetype * setlocal expandtab
    au Filetype java setlocal noexpandtab
augroup END

if exists('g:gui_oni')
    " Enable GUI mouse behavior
    set mouse=a
endif
