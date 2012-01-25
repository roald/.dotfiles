# Using just the dots for moving up
alias ..="cd .."
alias cd..="cd .."


# Colorful LS commands with some other presets
alias ls="ls -FG"
alias ll="ls -l"
alias la="ls -AlG"


# Previewing files
alias o="less"


# Opening files in Espresso
alias esp="open -a Espresso"


# Useful and fun GIT shortcuts
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gco="git checkout"
alias grm="git status | grep deleted | awk '{print $3}' | xargs git rm"
