# PROFILE MANAGEMENT FILES

## INSTALL

Link profile file to profile file in this folder. This file will set all aliases

* ln -s ~/.dotfiles/main.sh ~/.profile
* ln -s ~/.dotfiles/main.sh ~/.bash_profile

When the .profile file is needed for additional computer based stuff, add the following code

if [ -f ~/.dotfiles/main.sh ]
then
  source ~/.dotfiles/main.sh
fi

Also provide symlinks for..

* .vimrc
* .vim/ 

## Contents

Providing aliases and shell modifications.

Shortcuts for GIT and Ruby 
