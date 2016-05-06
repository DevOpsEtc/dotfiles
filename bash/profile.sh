  #######################################################
  ##  filename: profile.sh                             ##
  ##  path:     ~/src/config/dotfiles/bash/            ##
  ##  symlink:  ~/.bash_profile                        ##
  ##  purpose:  bash shell settings                    ##
  ##  date:     05/04/2016                             ##
  ##  repo:     https://github.com/WebAppNut/dotfiles  ##
  #######################################################

  SHELL_SESSION_HISTORY=0

# assign value of bash dotfiles path
bash_dots=$HOME/src/config/dotfiles/bash

# source custom shell settings; OSX login shells don't process the .bashrc
. $HOME/src/config/dotfiles/bash/bashrc.sh

# source bash command aliases
. $bash_dots/aliases.sh

# source bash-git-prompt
. $bash_dots/gitprompt.sh
