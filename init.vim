"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         PLUG                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Text objects
Plug 'wellle/targets.vim'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language features
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'calviken/vim-gdscript3'

" Colors
Plug 'ayu-theme/ayu-vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                       COLORS                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set termguicolors
set background=dark
let ayucolor="dark"

colorscheme ayu

highlight SignColumn ctermbg=NONE guibg=NONE
highlight DiffAdd guibg=NONE
highlight DiffChange guibg=NONE
highlight DiffDelete guibg=NONE guifg=#FF3333
highlight GitGutterAdd guibg=NONE
highlight Comment gui=italic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         OPTIONS                           "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fzf_command_prefix = 'Fzf'

let g:vimwiki_list = [{'path': '~/Wiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]

set foldmethod=syntax
set foldlevelstart=20

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

set autoread

let mapleader = " "
let g:mapleader = " "

set mouse=a

set so=7

set emoji
set wildmenu
set wildoptions=pum
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

" set listchars=tab:▸\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:+

set statusline=""
set statusline+=\ %t
set statusline+=%m
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ %y
set statusline+=\ [%l/%L]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Bd bp|bd #
nnoremap <leader><CR> :noh<CR>

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>bd :Bd<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

noremap <silent> <leader>tn :tabnew <CR>
noremap <silent> R :tabnext <CR>
noremap <silent> E :tabprevious <CR>

nnoremap <leader>/ :grep<space>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Move selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>fb :FzfBuffers<CR>
nnoremap <leader>fl :FzfLines<CR>

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

nnoremap <leader>e :call ToggleFileManager()<CR>
nnoremap <leader>fi :call IdFind()<CR>

nnoremap / /\v

nnoremap Y "+y
vnoremap Y "+y

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr><C-p> pumvisible() ? "\<C-p>" : coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><c-space> coc#refresh()

vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

let g:vimwiki_table_mappings = 0

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gD <Plug>(coc-implementation)
nmap <silent>gh :call CocAction('doHover')<CR>
nmap <silent><C-h> :call CocActionAsync('showSignatureHelp')<CR>
imap <silent><C-h> <Esc>:call CocActionAsync('showSignatureHelp')<CR>a
nmap <silent>go :CocList outline<cr>
nmap <silent>ga :CocList diagnostics<cr>
nmap <silent>gp :CocListResume<CR>
nmap <silent>gr <Plug>(coc-rename)
vmap <leader>ac  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <silent><leader>fr <Plug>(coc-references)
nmap <silent>[c <Plug>(coc-diagnostic-prev)
nmap <silent>]c <Plug>(coc-diagnostic-next)
nmap <silent><leader>qf <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                        FUNCTIONS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Using floating windows of Neovim to start fzf
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' } 


" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.8)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Normal
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
    tnoremap <buffer> <silent> <Esc> <C-\><C-n>:call DeleteUnlistedBuffers()<CR>
endfunction

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        call DeleteUnlistedBuffers()
    endif
endfunction

function! DeleteUnlistedBuffers()
    for n in nvim_list_bufs()
        if ! buflisted(n)
            call CleanupBuffer(n)
        endif
    endfor
endfunction

function! CleanupBuffer(buf)
    if bufexists(a:buf)
        silent execute 'bwipeout! '.a:buf
    endif
endfunction

function! OnTermExit(job_id, code, event) dict
    call DeleteUnlistedBuffers()
endfunction

function! ToggleLazyGit()
    call ToggleTerm('lazygit')
endfunction

function! ToggleFileManager()
    let file = expand('%:h')
    call CreateCenteredFloatingWindow()
    call termopen('nnn -p /tmp/chosenfile ' . file, { 'on_exit': function('OnFileManagerExit') })
endfunction

function! OnFileManagerExit(id, code, event) dict
    call DeleteUnlistedBuffers()
    try
        if filereadable('/tmp/chosenfile')
            exec 'edit ' . readfile('/tmp/chosenfile')[0]
            call system('echo '' > /tmp/chosenfile')
        endif
    endtry
endfunction

function! IdFind()
    call CreateCenteredFloatingWindow()
    call termopen('idfind', { 'on_exit': function('OnIdFindExit') })
endfunction

function! OnIdFindExit(id, data, event) dict
    exec setreg('"', trim(join(getline(1,'$'))))
    call DeleteUnlistedBuffers()
    :normal p
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         AUTOCMDS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
    au BufEnter *.java nmap gr :JavaRename 

    au BufEnter *.java nmap <leader>fr :JavaSearch -x references<CR>

    au FileType fzf set nonu nornu

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

    " autocomplete
    au BufEnter * inoremap <silent><expr><c-space> coc#refresh()
    au BufEnter *.java inoremap <silent><c-space> <C-x><C-u>
    au BufEnter * inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : coc#refresh()
    au BufEnter * inoremap <silent><expr><C-p> pumvisible() ? "\<C-p>" : coc#refresh()
    au BufEnter *.java inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"
    au BufEnter *.java inoremap <silent><expr><C-p> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"

    " Errorformats
    au BufEnter *.ts set errorformat=\ %#at\ %.%#(%f:%l:%c)
    au BufEnter *.tsx set errorformat=\ %#at\ %.%#(%f:%l:%c)

    " Auto reload init.vim
    au BufWritePost */init.vim source $MYVIMRC
augroup END

source ~/.config/nvim/work.init.vim
