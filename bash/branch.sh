# Functions to determine Git branch and status

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state=" *"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote=" ${txtgrn}↑"
    else
      remote=" ${txtblu}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote=" ${txtblu}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch}${state}${remote}${txtred})"
  fi
}

function prompt_func() {
    previous_return_value=$?;
    #prompt="\[$txtgrn\]\u\[$txtwht\] at\[$txtcyn\] \h: \[$txtrst\]\w\[$txtred\]$(__git_ps3)\[$txtrst\]"
    prompt="\[$txtrst\]\w\[$txtred\]$(__git_ps1)\[$txtrst\]"
    statusbar="\[$(~/.iterm2/it2setkeylabel set status "$(test -d .git && echo "branch $(__git_ps1)" || (echo -n 'not a repo'))")\]"
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}${statusbar} \$ "
    else
        PS1="${prompt}${statusbar} ${txtred}➔${txtrst} "
    fi
}

PROMPT_COMMAND=prompt_func

# Default Git enabled prompt
source ~/.dotfiles/bash/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
# export GIT_PS1_SHOWUNTRACKEDFILES=true
# export GIT_PS1_SHOWUPSTREAM="auto"
