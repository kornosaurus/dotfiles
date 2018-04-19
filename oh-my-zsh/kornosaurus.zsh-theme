local ret_status="%(?:%{$fg[green]%}>>:%{$fg[red]%}>>)"
PROMPT='%{$fg[cyan]%}%~%{$reset_color%} ${ret_status} '
RPROMPT='$(git_prompt_info)%{$fg_bold[grey]%}%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg_bold[yellow]%}*%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
