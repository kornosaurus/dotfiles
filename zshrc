export LC_ALL="en_US.UTF-8"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export GOPATH=$HOME/.go
export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$N_PREFIX/bin:$HOME/.bin:$HOME/.bin/work/:$HOME/Apps/alacritty/target/release:$HOME/.cargo/bin:$PATH:$ANT_HOME/bin:$HOME/Applications/arduino-1.8.13/bin:/usr/local/go/bin:$GOPATH/bin

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=nvim
export BROWSER=firefox
export TERM="xterm-256color"

export REVIEW_BASE=master
gfiles() {
    git diff --name-only $1 $(git merge-base $1 $REVIEW_BASE)
}
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

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


# vim mode
bindkey -v
export KEYTIMEOUT=1

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# edit command in vim
bindkey "^e" edit-command-line


# Aliases
alias lg='lazygit'
alias xclip='xclip -selection c'

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'

alias v='nvim'
alias oni='~/Programs/Onivim2-x86_64-master.AppImage'

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

if [ -e $HOME/Programs/z ]; then
    source $HOME/Programs/z/z.sh
fi

# Use fzf!
if [ -e /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --hidden --files --null | xargs -0 dirname | uniq'
export FZF_DEFAULT_OPTS='--height 40% --reverse'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
