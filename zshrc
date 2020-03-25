export LC_ALL="en_US.UTF-8"
export ANT_HOME="/home/simonk/Apps/apache-ant-1.10.3"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/bin/work/:/usr/local/bin:/opt/local/bin:$HOME/Apps/alacritty/target/release:$HOME/.cargo/bin:$PATH:$ANT_HOME/bin:/home/simonk/.local/bin:$HOME/go/bin

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=nvim
export BROWSER=firefox

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

export REVIEW_BASE=master
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

ZSH_THEME="kornosaurus"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vim mode
# bindkey -v
# export KEYTIMEOUT=1

# Better searching in command mode
# bindkey -M vicmd '?' history-incremental-search-backward
# bindkey -M vicmd '/' history-incremental-search-forward
# 
# # Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search
# 
# # edit command in vim
# bindkey "^e" edit-command-line

# Aliases
alias lg='lazygit'
alias v='nvr -s'
alias xclip='xclip -selection c'

export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"

export VISUAL=nvim

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# title
export ZSH_THEME_TERM_TITLE_IDLE="%1/"

# Use fzf!
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!**/{build,.git,gen,coverage,node_modules}/**" 2> /dev/null'
export FZF_CTRL_T_COMMAND='rg --hidden --files --null | xargs -0 dirname | uniq'

export FZF_DEFAULT_OPTS="--height 40% --reverse"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.profile
source /home/simonk/Apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /home/simonk/Apps/z/z.sh
