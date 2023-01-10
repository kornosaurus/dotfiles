export DOTNET_CLI_TELEMETRY_OPTOUT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export DENO_INSTALL="/home/simon/.deno"
export GOPATH=$HOME/.go
export GOROOT=$HOME/.go
export PATH=$PATH:$N_PREFIX/bin:$HOME/.bin:$HOME/.bin/work:$HOME/.cargo/bin:$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$DENO_INSTALL/bin:$PATH"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export EDITOR="nvim"

# Prompt
autoload -U colors && colors
setopt PROMPT_SUBST
autoload -Uz add-zsh-hook vcs_info
zstyle ':vcs_info:*' enable git

() {
    local formats="%{$reset_color%}%{$fg[red]%}%b%c%u%{$reset_color%}"
    local actionformats="${formats}%{${fg[default]}%} ${PRCH[sep]} %{${fg[green]}%}%a"
    zstyle ':vcs_info:*:*' formats           $formats
    zstyle ':vcs_info:*:*' actionformats     $actionformats
    zstyle ':vcs_info:*:*' stagedstr         "%{${fg[green]}%}·"
    zstyle ':vcs_info:*:*' unstagedstr       "%{${fg[yellow]}%}·"
    zstyle ':vcs_info:*:*' check-for-changes true
}

add-zsh-hook precmd vcs_info

export PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[red]%}%m %{$fg[yellow]%}%c%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}) ➜%{$reset_color%} '
export RPROMPT='${vcs_info_msg_0_}'

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#     exec tmux
# fi

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --hidden --files --null | xargs -0 dirname | uniq'
export FZF_DEFAULT_OPTS='--height 40% --reverse'

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -e /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

