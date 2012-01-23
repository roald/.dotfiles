# PROFILE MANAGEMENT FILES

## INSTALL

Link profile file to profile file in this folder. This file will set all aliases

* ln -s ~/.dotfiles/profile ~/.profile
* ln -s ~/.dotfiles/profile ~/.bash_profile

When the .profile file is needed for additional computer based stuff, add the following code

if [ -f ~/.dotfiles/.profile ]
then
  source ~/.dotfiles/.profile
fi

## Contents

Providing aliases and shell modifications.

Shortcuts for GIT and Ruby 
