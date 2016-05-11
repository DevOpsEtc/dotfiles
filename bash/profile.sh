#######################################################
##  filename: profile.sh                             ##
##  path:     ~/src/config/dotfiles/bash/            ##
##  symlink:  ~/.bash_profile                        ##
##  purpose:  bash shell settings                    ##
##  date:     05/11/2016                             ##
##  repo:     https://github.com/WebAppNut/dotfiles  ##
#######################################################

# disable per-terminal bash sessions
# not needed if bashrc has shopt -s histappend
# SHELL_SESSION_HISTORY=0

src_files=(
  colors.sh     # source color assignments
  bashrc.sh     # source shell settings; OSX login shells don't process .bashrc
  aliases.sh    # source bash command aliases
  gitprompt.sh  # source bash-git-prompt
)

for i in "${src_files[@]}"; do
  . $HOME/src/config/dotfiles/bash/$i  # source file
done
