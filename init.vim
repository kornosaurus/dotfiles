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

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'racer-rust/vim-racer'
Plug 'jiangmiao/auto-pairs'

Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'

Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'

Plug 'dansomething/vim-eclim'

Plug 'SirVer/ultisnips'

Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'dracula/vim'
call plug#end()

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                       COLORS                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set termguicolors
set background=dark

colorscheme pencil

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

let g:AutoPairsMapCh=0

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


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
let g:deoplete#omni#input_patterns.java = '[\w\.]*'
let g:deoplete#omni#input_patterns.html = '<[^>]*'
let g:deoplete#omni#input_patterns.xml  = '<[^>]*'
let g:deoplete#omni#input_patterns.md   = '<[^>]*'
let g:deoplete#omni#input_patterns.css   = '[\w:]+'
let g:deoplete#omni#input_patterns.scss   = '[\w:]+'

let g:nvim_typescript#diagnostics_enable = 0

let g:echodoc_enable_at_startup = 1

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

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

set signcolumn=yes

set updatetime=100

set nowrap

let g:netrw_banner = 0

"set number
"set relativenumber

set conceallevel=3 concealcursor=niv
" set cursorline

" make vimdiff not readonly
set noro 

set diffopt+=vertical

filetype plugin on
filetype indent on

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

set autoread

let mapleader = " "
let g:mapleader = " "

set mouse=a

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
" set undodir=~/.vim/undodir
" set undofile

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

" STATUSLINE "

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader><CR> :noh<CR>

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bk :bufdo bd<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

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

inoremap <expr> <C-n> pumvisible() ? "<C-n>" : deoplete#mappings#manual_complete()

" DEFX
nnoremap <leader>e :Defx -split=vertical -winwidth=50 -direction=topleft `expand('%:p:h')` -search=`expand('%:p')` -toggle<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:filename:type:size:time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'Time')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         AUTOCMDS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup autocommands
    au BufEnter *.java nmap gd :JavaSearch -a edit<CR>
    au BufEnter *.java nmap gD :JavaSearch -x implementors -a edit<CR>
    au BufEnter *.java nmap gs :JavaSearch -a vsplit<CR>
    au BufEnter *.java nmap gi :JavaImport<CR>
    au BufEnter *.java nmap gh :JavaDocPreview<CR>
    au BufEnter *.java nmap gr :JavaRename<CR>
    au BufEnter *.java nmap <leader>fr :JavaSearch -x references<CR>

    au BufEnter *.js,*.ts,*.tsx,*.jsx nmap gd :TSDef<CR>
    au BufEnter *.js,*.ts,*.tsx,*.jsx nmap gs :TSDefPreview<CR>
    au BufEnter *.js,*.ts,*.tsx,*.jsx nmap gh :TSDoc<CR>
    au BufEnter *.js,*.ts,*.tsx,*.jsx nmap gr :TSRename<CR>
    au BufEnter *.js,*.ts,*.tsx,*.jsx nmap <leader>ft :TSRefs<CR>

    " indentation
    au BufEnter * setlocal expandtab
    au BufEnter *.java setlocal noexpandtab

    " au BufEnter * exe ":EclimDisable"

    " error format
    au BufEnter *.java exe ":compiler ant"
    " au BufEnter *.java exe ":EclimEnable"
    au BufEnter *.java set makeprg=/home/simonk/bin/work/ufo-build
    au BufEnter *.java set errorformat=\ %#[%.%#]\ %#%f:%l:%v:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
    \%A\ %#[%.%#]\ %f:%l:\ %m,%-Z\ %#[%.%#]\ %p^,%C\ %#[%.%#]\ %#%m,
    \%-G%.%#

augroup END

