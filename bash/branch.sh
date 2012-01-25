# Default Git enabled prompt
export GIT_PS1_SHOWDIRTYSTATE=true # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files

export PS1="\[$txtgrn\]\u\[$txtrst\]: \w\[$txtred\]$(__git_ps1)\[$txtrst\] \$ "

