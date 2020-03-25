"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         PLUG                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Text objects
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" Fzf
Plug '/home/simonk/.fzf'
Plug 'junegunn/fzf.vim'

" IDE Features
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'dansomething/vim-eclim'

" Git
Plug 'tpope/vim-fugitive'

" Efficient coding
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'calviken/vim-gdscript3'
Plug 'mustache/vim-mustache-handlebars'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colors
Plug 'hzchirs/vim-material'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'dracula/vim'
Plug 'whatyouhide/vim-gotham'
Plug 'liuchengxu/space-vim-dark'
Plug 'srcery-colors/srcery-vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" AirLine
let g:airline_powerline_fonts = 0
let g:airline_theme='nord'

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:fzf_command_prefix = 'Fzf'

let g:material_terminal_italics = 1
let g:material_style='oceanic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                       COLORS                              "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set termguicolors
set background=dark
set guicursor=

colorscheme nord

"highlight EndOfBuffer guifg=grey
"highlight NonText guifg=#353432
highlight Comment gui=italic
highlight Conditional gui=italic
highlight Repeat gui=italic
highlight Label gui=italic
highlight Keyword gui=italic

"highlight CursorLineNr ctermfg=1
"highlight StatusLine guibg=NONE ctermfg=2 ctermbg=0
"highlight Whitespace ctermbg=NONE ctermfg=grey guifg=#353432 guibg=NONE
"highlight Normal guibg=NONE ctermbg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight LineNr ctermbg=NONE guibg=NONE guifg=grey
"highlight CursorLineNr ctermbg=NONE guibg=NONE
"highlight SignColumn ctermbg=NONE guibg=NONE
"highlight DiffChange ctermbg=NONE guibg=NONE guifg=#ebcb8b
"highlight DiffDelete ctermbg=NONE guibg=NONE
"highlight DiffAdd ctermbg=NONE guibg=NONE guifg=#a3be8c
"highlight CocHighlightText guibg=#333333
"highlight TabLine gui=NONE
highlight Substitute gui=NONE guibg=#88c0d0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         OPTIONS                           "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:vimwiki_list = [{'path': '~/Wiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]

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

set number
set relativenumber

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

set listchars=tab:▸\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:+ " Define how list mode appears

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         MAPPINGS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Bd bp|bd #
nnoremap <leader><CR> :noh<CR>

nnoremap <leader><Tab> :b#<CR>
nnoremap <leader>bd :Bd<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

noremap <silent> <leader>tn :tabnew <CR>
noremap <silent> R :tabnext <CR>
noremap <silent> E :tabprevious <CR>

nnoremap <leader>/ :grep<space>

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
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" lazygit
nnoremap <leader>lg :call ToggleLazyGit()<CR>
" ranger
nnoremap <leader>e :call ToggleRanger()<CR>
" idfind
nnoremap <leader>fi :call IdFind()<CR>

nnoremap / /\v

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr><C-p> pumvisible() ? "\<C-p>" : coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><c-space> coc#refresh()

vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

let g:vimwiki_table_mappings = 0

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gD <Plug>(coc-implementation)
nmap <silent>gh :call CocAction('doHover')<CR>
nmap <silent><C-h> :call CocActionAsync('showSignatureHelp')<CR>
nmap <silent>go  :CocList outline<cr>
nmap <silent>ga  :CocList diagnostics<cr>
nmap <silent>gp  :CocListResume<CR>
nmap <silent>gr <Plug>(coc-rename)
imap <silent><C-h> <Esc>:call CocActionAsync('showSignatureHelp')<CR>a
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

" Using floating windows of Neovim to start fzf
let $FZF_DEFAULT_OPTS = '--color=bg+:#2e3440 --layout=reverse'
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' } 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                        FUNCTIONS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Normal
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
    tnoremap <buffer> <silent> <Esc> <C-\><C-n><CR>:call DeleteUnlistedBuffers()<CR>
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
            let name = bufname(n)
            if name == '[Scratch]' ||
              \ matchend(name, ":bash") ||
              \ matchend(name, ":lazygit")
                call CleanupBuffer(n)
            endif
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

function! ToggleRanger()
    let file = expand('%:h')
    call CreateCenteredFloatingWindow()
    call termopen('nnn -p /tmp/chosenfile ' . file, { 'on_exit': function('OnRangerExit') })
endfunction

function! OnRangerExit(id, code, event) dict
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
    if a:data != 129
        :normal p
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                           "
"                         AUTOCMDS                          "
"                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup autocommands
    " Restore last cursor position and marks on open
    au BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
                \ |   exe "normal! g`\""
                \ | endif
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " autocmd CursorHold * silent call CocActionAsync('highlight')

    autocmd TermOpen * startinsert
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
    autocmd BufRead,BufNewFile *.sls set filetype=yaml
    autocmd BufRead,BufNewFile *.trans set filetype=translations

    " indentation
    au BufEnter * setlocal expandtab
    au BufEnter * setlocal shiftwidth=4
    au BufEnter * setlocal tabstop=4
    au BufEnter *.java setlocal noexpandtab
    au BufEnter *.sls setlocal shiftwidth=2
    au BufEnter *.sls setlocal tabstop=2
    au BufEnter *.yml setlocal shiftwidth=2
    au BufEnter *.yml setlocal tabstop=2

    " spelling
    autocmd FileType markdown setlocal spell
    autocmd FileType vimwiki setlocal spell
    autocmd FileType translations setlocal spell

    au BufEnter *.urdl nmap set ft=urdl

    " autocomplete
    au BufEnter * inoremap <silent><expr><c-space> coc#refresh()
    au BufEnter *.java inoremap <silent><c-space> <C-x><C-u>
    au BufEnter * inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : coc#refresh()
    au BufEnter * inoremap <silent><expr><C-p> pumvisible() ? "\<C-p>" : coc#refresh()
    au BufEnter *.java inoremap <silent><expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"
    au BufEnter *.java inoremap <silent><expr><C-p> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"

    au BufEnter *.java set makeprg=/home/simonk/bin/work/ufbuild
    au BufEnter *.java set errorformat=\ %#[%.%#]\ %#%f:%l:%v:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
    \%A\ %#[%.%#]\ %f:%l:\ %m,%-Z\ %#[%.%#]\ %p^,%C\ %#[%.%#]\ %#%m,
    \%-G%.%#
augroup END
