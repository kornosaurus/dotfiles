"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         PLUG                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'Shougo/echodoc.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug '/home/simonk/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'racer-rust/vim-racer'

Plug 'HerringtonDarkholme/yats.vim'

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'chriskempson/base16-vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                       COLORS                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set termguicolors
set background=dark

colorscheme base16-tomorrow-night
let g:airline_theme='base16_tomorrow'
let g:airline_powerline_fonts = 1

highlight EndOfBuffer guifg=grey
highlight Comment cterm=italic
highlight CursorLineNr ctermfg=1
highlight StatusLine guibg=NONE ctermfg=2 ctermbg=0
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

let g:vimwiki_list = [{ 'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md' }]

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

let g:startify_change_to_vcs_root = 1

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

set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#disable_auto_complete = 1

call deoplete#custom#option('ignore_sources', {'_': ['buffer']})
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.java = '[\w\.]+'
let g:deoplete#omni#input_patterns.html = '<[^>]*'
let g:deoplete#omni#input_patterns.xml  = '<[^>]*'
let g:deoplete#omni#input_patterns.md   = '<[^>]*'
let g:deoplete#omni#input_patterns.css   = '[\w:]+'
let g:deoplete#omni#input_patterns.scss   = '[\w:]+'

let g:nvim_typescript#diagnostics_enable = 0

let g:echodoc_enable_at_startup = 1

" Disable default snippet
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }

let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_completed_snippet=1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tslint', 'tsserver', 'typecheck'],
\   'java': [],
\   'rust': ['cargo'],
\   'python': ['flake8'],
\}

let g:ale_linter_aliases = {
\   'typescript.tsx': 'typescript'
\ }

set signcolumn=yes

set updatetime=100

set wrap

let g:netrw_banner = 0

set number relativenumber

set conceallevel=3 concealcursor=niv
set cursorline

filetype plugin on
filetype indent on

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

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

set laststatus=2
set smarttab

set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

set splitbelow
set splitright

set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader><CR> :noh<CR>

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bk :bufdo bd<CR>

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

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Glog<cr>

nnoremap / /\v
" grep
nnoremap <leader>/ :grep!<space>

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
    au Filetype java nmap gh :JavaDocSearch -x declarations<CR>
    au Filetype java nmap <leader>i :JavaImport<CR>

    au Filetype javascript,typescript,typescript.tsx nmap gd :TSDef<CR>
    au Filetype javascript,typescript,typescript.tsx nmap gs :TSDefPreview<CR>
    au Filetype javascript,typescript,typescript.tsx nmap gp :TSType<CR>

    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gv <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)

    " indentation
    au Filetype * setlocal expandtab
    au Filetype java setlocal noexpandtab
augroup END

