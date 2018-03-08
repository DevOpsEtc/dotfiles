#######################################################################
##  filename: bashrc.sh                                              ##
##  path:     ~/projects/config/dotfiles/bash/       		     ##
##  purpose:  bash shell configuration                               ##
##  date:     11/27/2017                                             ##
##  note:     sourced via bash_profile                               ##
##  repo:     https://github.com/DevOpsEtc/dotfiles                  ##
#######################################################################

## Paths ##############################################################
projects=$HOME/projects                       # path to projects folder
cfg=$projects/config                          # path to config folder
dep=$projects/deploy                          # path to deploy folder
blog=$projects/blog/hugo             	      # path to website folder
# p_ply=$HOME/work/provision/playbook         # path: ansible assets
# p_inv=$p_ply/inventory                      # path: ansible inventory
# p_pbk=$p_ply/playbook.yml                   # path: ansible main playbook
# p_vl=$p_ply/vars/vault_local.yml            # path: ansible vault_local.yml
# p_vs=$p_ply/vars/vault_server.yml           # path: ansible vault_server.yml
# c_ap="ansible-playbook -i $p_inv $p_pbk"    # command: playbook & options
# c_ap2=--ask-vault-pass                      # command: playbook vault option

## Colors (scripts & prompt) ##########################################
export rs=$(tput sgr0)                        # text: reset attributes
export blue=$(tput setaf 33)                  # text: blue
export gray=$(tput setaf 250)                 # text: gray
export green=$(tput setaf 64)                 # text: green
export greenb=$(tput bold && tput setaf 64)   # text: green & bold
export red=$(tput setaf 160)                  # text: red
export redb=$(tput bold && tput setaf 160)    # text: red & bold
export yellow=$(tput setaf 136)               # text: yellow
export yellowb=$(tput bold && tput setaf 136) # text: yellow & bold
export white=$(tput setaf 7)                  # text: white

## Editor #############################################################
export EDITOR="atom -nw"                    # use atom as default text editor
export GIT_EDITOR=$EDITOR                   # use vim in as default git editor
export GREP_OPTIONS='--color=auto'          # always colorize grep matches
export VISUAL=vim                           # use vim for visudo & crontab

## History ############################################################
export HISTFILE=$projects/.bash_history     # command history filepath
export HISTFILESIZE=5000                    # max commands stored in history
export HISTSIZE=5000                        # max commands to save in a session
export HISTTIMEFORMAT='%D %T '              # prefix timestamp on history list
export HISTCONTROL=ignoreboth:erasedups     # ignore leading space & kill dups
export HISTIGNORE="?:??:htop:vim:atom"      # ignore commands; 1 & 2 character

## NVM (Node Version Manager) #########################################
export NVM_DIR="$HOME/.nvm"                 # nvm working directory
export NVM_SCR="$NVM_DIR/nvm.sh"            # nvm script path
[ -s "$NVM_SCR" ] && . "$NVM_SCR"           # source nvm script

## Brew ###############################################################
cask_app=--appdir="/Applications"           # path to symlinked cask apps
export HOMEBREW_CASK_OPTS="$cask_app"       # brew cask install options

# Path Statement ######################################################
p_brew=/usr/local/bin:/usr/local/sbin       # path: homebrew apps
p_bin=$cfg/bin                              # path: custom shell scripts
export PATH="$p_brew:$p_bin:$PATH"          # append to $PATH statement

## Prompt #############################################################
prompt() {
  # purpose: all prompt related variables & commands
  # run these commands before each PS1 prompt refresh
  PROMPT_COMMAND=' \
    # dynamic xterm title: ~/; \
    # echo -ne "\033]0;${PWD/${HOME}/~}\007"; # set in git-prompt-colors.sh; \
    # trim pwd path to last two directories; \
    [ $(tput cols) -lt 50 ] && PROMPT_DIRTRIM=2 || PROMPT_DIRTRIM=0; \
    # append session command history to global; rm session; read in global; \
    history -a; history -c; history -r; \
    # refresh scratch count; \
    scratch; \
    # add new line before prompt; \
    echo;'

  GIT_PROMPT_ONLY_IN_REPO=1                 # appends git repo info to PS1
  GIT_PROMPT_THEME=Custom                   # custom .git-prompt-colors.sh
  # GIT_PROMPT_FETCH_REMOTE_STATUS=0        # no fetch remote status
  # GIT_PROMPT_SHOW_UPSTREAM=1              # show upstream tracking branch

  # build out custom PS1 prompt
  PS1='\[\033]0;\w\007\]'                     # xterm title: pwd = ~/
  # PS1+='\[$blue\]\w'                        # pwd $HOME = short ~/
  PS1+='\[$gray\]\w'                          # pwd $HOME = short ~/
  PS1+='\[$yellow\]'                          # set dynamic count text color
  PS1+='$([ $sc -gt 0 ] && echo \ ⁼$sc)'      # show scratch note count if > 0
  PS1+='$([ \j -gt 0 ] && echo \ *\j)'        # show background job count > 0
  PS1+=' \[$redb\]❯\[$yellowb\]❯\[$greenb\]❯' # multicolored unicode symbols
  PS1+='\[$rs\] '                             # reset color; space after prompt
}

## Misc (keep ordered at bottom) ######################################
prompt                  # build custom prompt
# umask 002               # set default perms @dir/files
set -o noclobber        # no redirect overwrite; override >|
shopt -s histappend     # append history; no clobber
