PROMPT='%{$fg[green]%}[%n]%{$fg[green]%}%% %{$reset_color%}'
# PROMPT='%{$fg[green]%}[%n] %{$fg_bold[blue]%}%2~$(git_prompt_info) %{$fg[green]%}%% %{$reset_color%}'
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg_bold[blue]%}${WSL_DISTRO_NAME:+$WSL_DISTRO_NAME:}%m%{$reset_color%}'
# RPS1='%{$fg[white]%}%2~ %{$fg_bold[blue]%}%m%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"

