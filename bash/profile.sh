#######################################################
##  filename: profile.sh                             ##
##  path:     ~/projects/config/dotfiles/bash/       ##
##  symlink:  ~/.bash_profile                        ##
##  purpose:  bash shell settings                    ##
##  date:     06/04/2016                             ##
##  repo:     https://github.com/DevOpsEtc/dotfiles  ##
#######################################################

# disable per-terminal bash sessions
# not needed if bashrc has shopt -s histappend
# SHELL_SESSION_HISTORY=0

projects_files=(
  aliases.sh    # source bash command aliases
  functions.sh  # source bash functions
  bashrc.sh     # source shell settings; OSX login shells don't process .bashrc
  gitprompt.sh  # source bash-git-prompt
)

for i in "${projects_files[@]}"; do
  . $HOME/projects/config/dotfiles/bash/$i  # source file
done
