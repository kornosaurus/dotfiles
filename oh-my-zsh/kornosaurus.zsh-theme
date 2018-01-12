PROMPT='%{$fg_bold[green]%}%c%{$reset_color%} $(git_prompt_info)%{$fg_bold[white]%}» %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%} "

VIM_NORMAL="%{$fg_bold[yellow]%}[% NORMAL]%{$reset_color%}"
VIM_INSERT="%{$fg_bold[green]%}[% INSERT]%{$reset_color%}"
RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}%{$fg_bold[white]%}[%*]%{$reset_color%}"

function zle-line-init zle-keymap-select {
  VIM_NORMAL="%{$fg_bold[yellow]%}[% NORMAL]%{$reset_color%}"
  VIM_INSERT="%{$fg_bold[green]%}[% INSERT]%{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}%{$fg_bold[white]%}[%*]%{$reset_color%}"
  zle reset-prompt
}
