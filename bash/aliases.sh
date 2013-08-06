# Using just the dots for moving up
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."


# Directory shortcuts
alias ddrop="cd ~/Documents/Dropbox/Dropbox"
alias ddesk="cd ~/Desktop"
alias ddown="cd ~/Downloads"
alias dweb="cd ~/Documents/webroot"


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# Colorful LS commands with some other presets
alias ls="ls -F ${colorflag}"
alias ll="ls -l ${colorflag}"
alias la="ls -Al ${colorflag}"
alias lsd='ls -l ${colorflag} | grep "^d"'


# Previewing files
alias o="less"


# Opening files in Espresso
alias esp="open -a Espresso"


# Useful and fun GIT shortcuts

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias gs="git status"
alias gss="git status -s -b"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gco="git checkout"
alias grm="git status | grep deleted | awk '{print $3}' | xargs git rm"
alias glog="git log --graph --pretty=format:'%Cblue%h %Cgreen%aN%Creset: %s %Cred%cr'"
alias gpo="git push origin"
alias gpob="git push origin $(current_branch)"
