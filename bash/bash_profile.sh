  #######################################################
  ##  filename: bash_profile.sh                        ##
  ##  path:     ~/src/config/dotfiles/bash/            ##
  ##  symlink:  ~/.bash_profile                        ##
  ##  purpose:  default bash shell settings            ##
  ##  date:     10/07/2015                             ##
  ##  repo:     https://github.com/WebAppNut/dotfiles  ##
  #######################################################

# login shells don't process .bashrc, so source it manually if exists
if [ -e ~/.bashrc ]; then source ~/.bashrc; fi
