# set prompt settings aliases
source ~/.dotfiles/bash/colors.sh
source ~/.dotfiles/bash/aliases.sh

# bind
bind "set completion-ignore-case on"

# branch information
export PS1="\[\033[0;33m\]\u\[\033[00m\]:\[\033[00m\]\w\[\033[0;31m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[00m\]$\[\033[00m\] "

