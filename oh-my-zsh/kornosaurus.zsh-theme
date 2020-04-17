local ret_status="%(?:%{$fg[green]%}>>:%{$fg[red]%}>>)"
PROMPT='[%{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m %{$fg_bold[yellow]%}%c%{$reset_color%}] ${ret_status}%{$reset_color%} '
RPROMPT='$(vi_mode_prompt_info)$(git_prompt_info)'

MODE_INDICATOR="[%{$fg_bold[red]%}N%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg_bold[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
