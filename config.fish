set -x EDITOR nvim
set -x VISUAL nvim
set -x PATH $PATH /snap/bin
set -x TERMINAL alacritty

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
set -x FZF_CTRL_T_COMMAND '$FZF_DEFAULT_COMMAND'
set -x FZF_DEFAULT_OPTS "--color bg+:'#161c26'"

