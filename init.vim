"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         PLUG                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug '/home/simonk/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'dansomething/vim-eclim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'calviken/vim-gdscript3'

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

Plug 'SirVer/ultisnips'

Plug 'vimwiki/vimwiki'

Plug 'OmniSharp/omnisharp-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'dracula/vim'
Plug 'whatyouhide/vim-gotham'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

let &runtimepath.=',/home/simonk/Projects/translation-plugin'

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" AirLine
let g:airline_powerline_fonts = 1
let g:airline_theme='pencil'

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}'

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
highlight DiffChange ctermbg=NONE guibg=NONE
highlight DiffDelete ctermbg=NONE guibg=NONE
highlight DiffAdd ctermbg=NONE guibg=NONE
highlight CocHighlightText guibg=#333333


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         OPTIONS                           "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:vimwiki_list = [{ 'path': '~/Wiki/' }]

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

set completeopt-=preview

set signcolumn=yes

set updatetime=100

set nowrap

let g:netrw_banner = 0

" set number
" set relativenumber

set concealcursor=niv
set cursorline

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
set wildoptions=pum
set pumblend=10

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=1 IdLookup call TranslationLookup(<f-args>)

command! Bd bp|bd #
nnoremap <leader><CR> :noh<CR>

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>bd :Bd<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

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
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

let g:git_messenger_no_default_mappings=v:true
nmap <leader>m <Plug>(git-messenger)

nnoremap / /\v
nnoremap <leader>/ :grep!<space>

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr><C-p> pumvisible() ? "\<C-p>" : coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><C-n> pumvisible() ? "<C-n>" : coc#refresh()
inoremap <silent><expr><c-space> coc#refresh()

vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

nnoremap <leader>e :Explore<CR>

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gD <Plug>(coc-implementation)
nmap <silent>gh :call CocAction('doHover')<CR>
nmap <silent>gH :call CocActionAsync('showSignatureHelp')<CR>
nmap <silent>go  :CocList outline<cr>
nmap <silent>ga  :CocList diagnostics<cr>
nmap <silent>gp  :<C-u>CocListResume<CR>
nmap <silent>gs  :<C-u>CocList -I symbols<cr>
nmap <silent>gr <Plug>(coc-rename)
imap <silent><C-h> <Esc>:call CocActionAsync('showSignatureHelp')<CR>a
vmap <leader>ac  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <silent><leader>fr <Plug>(coc-references)
nmap <silent>[c <Plug>(coc-diagnostic-prev)
nmap <silent>]c <Plug>(coc-diagnostic-next)
nmap <silent><leader>qf <Plug>(coc-fix-current)
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         AUTOCMDS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup autocommands
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    au BufEnter * nmap <silent>gd <Plug>(coc-definition)
    au BufEnter * nmap <silent>gD <Plug>(coc-implementation)
    au BufEnter * nmap <silent>gh :call CocAction('doHover')<CR>
    au BufEnter * nmap <silent>gr <Plug>(coc-rename)
    au BufEnter * nmap <silent><leader>fr <Plug>(coc-references)

    au BufEnter *.java nmap gd :JavaSearch -a edit<CR>
    au BufEnter *.java nmap gD :JavaSearch -x implementors -a edit<CR>
    au BufEnter *.java nmap gs :JavaSearch -a vsplit<CR>
    au BufEnter *.java nmap gi :JavaImport<CR>
    au BufEnter *.java nmap gh :JavaDocPreview<CR>

    au BufEnter *.java nmap <leader>fr :JavaSearch -x references<CR>

    " indentation
    au BufEnter * setlocal expandtab
    au BufEnter *.java setlocal noexpandtab

    au BufEnter *.java set makeprg=/home/simonk/bin/work/ufobuild
    au BufEnter *.java set errorformat=\ %#[%.%#]\ %#%f:%l:%v:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
    \%A\ %#[%.%#]\ %f:%l:\ %m,%-Z\ %#[%.%#]\ %p^,%C\ %#[%.%#]\ %#%m,
    \%-G%.%#

augroup END
