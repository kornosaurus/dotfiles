"    ________  ___  __
"   |\   ____\|\  \|\  \
"   \ \  \___|\ \  \/  /|_
"    \ \_____  \ \   ___  \
"     \|____|\  \ \  \\ \  \
"       ____\_\  \ \__\\ \__\
"      |\_________\|__| \|__|
"      \|_________|

" {{{ Colors
highlight StatusLine   guibg=#001323
highlight StatusLineNC guibg=#00111f

highlight Type gui=bold
highlight SignColumn ctermbg=NONE guibg=NONE
" }}}

" {{{ Options

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
" set statusline+=\ %{GitBranch()}
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

" git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap <leader>gl :Git log -100<CR>
nnoremap <leader>dh :diffget //2<CR>
nnoremap <leader>dl :diffget //3<CR>

nnoremap <leader>lg :FloatermNew lazygit<CR>

nnoremap / /\v

nnoremap Y "+y
vnoremap Y "+y

nnoremap <C-q> :copen<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
nnoremap <leader>q :lopen<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprev<CR>

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

    " Spelling
    au FileType markdown setlocal spell
    au FileType vimwiki setlocal spell
    au FileType translations setlocal spell
    au FileType gitcommit setlocal spell


augroup END
" }}}

lua << EOF
require('init') -- FIXME: Remove when rest of config is moved to lua
EOF
