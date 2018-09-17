local ret_status="%(?:%{$fg[green]%}>>:%{$fg[red]%}>>)"
PROMPT='[%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[magenta]%}%m %{$fg_bold[cyan]%}%c%{$reset_color%}] ${ret_status}%{$reset_color%} '
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg_bold[yellow]%}*%{$reset_color%}%{]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{]%}"
