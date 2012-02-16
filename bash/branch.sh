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

function parse_svn_repo {
  repo="$(svn info 2>/dev/null | sed -ne  's#^Repository Root: ##p')"
  echo " (${repo})"
}

function prompt_func() {
    previous_return_value=$?;
    #prompt="\[$txtgrn\]\u: \[$txtrst\]\w\[$txtred\]$(__git_ps1)\[$txtrst\]"
    prompt="\[$txtgrn\]\u: \[$txtrst\]\w\[$txtred\]$(parse_git_branch)$(parse_svn_repo)\[$txtrst\]"
    if test $previous_return_value -eq 0
    then
        PS1="${prompt} $ "
    else
        PS1="${prompt} ${txtred}➔${txtrst} "
    fi
}

PROMPT_COMMAND=prompt_func


# Default Git enabled prompt
#source ~/.dotfiles/bash/git-completion.sh                                       
#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWSTASHSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export PS1="\[$txtgrn\]\u\[$txtrst\]: \w\[$txtred\] $(__git_ps1)\[$txtrst\] \$ "

#export PS1="\[$txtgrn\]\u\[$txtrst\]: \w\[$txtred\] $(parse_git_branch)\[$txtrst\] \$ "
