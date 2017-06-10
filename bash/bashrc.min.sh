#######################################################################
##  filename: bashrc.sh                                              ##
##  path:     ~/src/config/dotfiles/bash/                            ##
##  purpose:  bash shell minimal sane config                         ##
##  date:     06/10/2017                                             ##
##  note:     sourced via bash_profile                               ##
##  repo:     https://github.com/DevOpsEtc/dotfiles                  ##
#######################################################################

## Paths ##############################################################
fqdn="devopsetc.com"
live=/var/www/$fqdn/live/public               # production docroot
dev=/var/www/$fqdn/dev/public                 # staging docroot
live_cfg=/etc/nginx/sites-available/$fqdn     # nginx live server block
dev_cfg=/etc/nginx/sites-available/dev.$fqdn  # nginx dev server block
lsys=/var/log/syslog                          # system error/info
lsys=/var/log/auth.log                        # logins
lwe=/var/log/nginx/error.log                  # website errors
lwa=/var/log/nginx/access.log                 # website access

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
export EDITOR="vim"                           # use vim as default text editor
export GIT_EDITOR=$EDITOR                     # git editor
export VISUAL=$EDITOR                         # visudo & crontab editor

## History ############################################################
export HISTFILESIZE=5000                     # max commands stored in history
export HISTSIZE=5000                         # max commands to save in session
export HISTTIMEFORMAT='%D %T '               # prefix timestamp on history list
export HISTCONTROL=ignoreboth:erasedups      # ignore leading space & kill dups
export HISTIGNORE="?:??:htop:vim"            # ignore commands; 1 & 2 character

# Path Statement ######################################################
extra_bin=~/bin                              # path: custom shell scripts
export PATH="$extra_bin:$PATH"               # append to $PATH statement

# if xterm set title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;;
  *) ;;
esac

## Prompt #############################################################
PS1='\n\u@\h:\w\ $ '

## Aliases ###################################################
alias gliv='cd $live; ls -lahF'             # goto production docroot
alias gdev='cd $dev; ls -lahF'              # goto staging docroot
alias eliv='sudo vim $live_cfg'             # edit production server block
alias edev='sudo vim $dev_cfg'              # edit staging server block
alias ..='cd ..'                            # cd up 1 level
alias ..2='cd ../..'                        # cd up 2 levels
alias ..3='cd ../../..'                     # cd up 3 levels
alias ..4='cd ../../../..'                  # cd up 4 levels
alias al='alias_list'                       # show all loaded aliases; [term]
alias bak='backup'                          # backup(); [dir/file]
alias c='clear'                             # clear screen
alias cp='cp -iv'                           # copy; confirm; verbose
alias emv='set -o vi; echo "vi mode"'       # set edit mode to vi
alias eme='set -o emacs; echo "emacs mode"' # set edit mode to emacs (default)
alias fs='find . -name'                     # filename search [folder/file]
alias func='declare -F'                     # see list of active functions
alias funcf='declare -f'                    # see active functions
alias grep="grep --color=auto"              # show pretty matches
alias h='history'                           # list command history
alias hr='history_remove'                   # remove line(s) from history
alias hs='history_search'                   # search command history [term]
alias l.='ls -dAF .[^.]*'                   # ls only dotfiles
alias l='ls -fF'                            # list all; no sort; link=/, dir=@
alias lc='echo last command: $(fc -nl -1)'  # show last command
alias ld='ls -dA */'                        # ls only dirs
alias ll='ls -laF'                          # ls long; hidden; classify
alias lt='ls -Altr'                         # sort by date (latest @bottom)
alias lz='ls -AlShr'                        # sort by size (largest @bottom)
alias ln='ln -v'                            # link creation with verbose switch
alias mv='mv -iv'                           # move; confirm; verbose
alias path='echo -e ${PATH//:/\\n}'         # list all executable paths
alias ping='ping -c3'                       # limit ping to 3 attempts
alias R='. $HOME/.profile'                  # source .bash_profile
alias rm='rm -iv'                           # remove; confirm; verbose
alias ver='lsb_release -a'                  # list host os version

## Misc (keep ordered at bottom) ######################################
# umask 002               # set default perms @dir/files
set -o noclobber        # no redirect overwrite; override >|
shopt -s histappend     # append history; no clobber
unset GREP_OPTIONS      # override deprecated settings

alias_list() {
  # display loaded aliases
  # substitute alias column for "$" symbol; filter with optional [arg]
  alias | awk "/$1/ {\$1=\"$\"; print \$0}"
}
backup() {
  # purpose: make backup copy of directory or file w/ appended date
  if [ ! -z "$1" ]; then
    echo -e "$green\n \bcreating backup file... \n$rs"
    cp -a $1{,$(date +_%Y.%m.%d_%H.%M)}
    echo -e "$blue \bsuccess: \n$(ls -d -1 $1*) $rs"
  else
    echo -e "$yellow\n \busage: bak [path/to/file]"
    echo -e "example: $ bak ~/bud/build $rs"
  fi
}
history_remove() {
  # delete a range of contiguous lines from command history
  # arguments reversed because line numbers are dynamic
  if [ ! -z "$1" ]; then
    for line in $(seq $2 $1); do
      history -d $line
    done
  else
    echo -e "$yellow\n \busage: hd [line_start] [line_end]"
    echo -e "example: $ hd 405 409$rs"
  fi
}
history_search() {
  # search command history for matching term; multiple terms via [arg]
  # do if argument was passed
  if [ ! -z "$1" ]; then
    if [ "$1" == "+" ]; then
      # multi-term OR search; case-insensitive
      # run in subshell; puts "|" between arguments for proper grep syntax
      cmd='(IFS="|$IFS"; history | grep -iwE "${*:2}")'
      cmd_c='(IFS="|$IFS"; history | grep -icwE "${*:2}")'
      echo -e "$yellow \b$ "$cmd": $rs"
      eval ${cmd}
      echo -e "$yellow \b**** found $(eval "${cmd_c}") lines matching one \
      \b\b\b\b\b\b\b\bword or another **** $rs"
    elif [ "$1" == "=" ]; then
      # multi-term AND search; case-insensitive
      # store supplied argument count
      cnt=$#
      # decrease count
      ((cnt--))
      # store temporary command
      cmd="history |"
      # loop though arguments; start at $2
      for i in "${@:2}"; do
        # do if not last argument
        if [ "$cnt" != "1" ]; then
          # build up grep commands; pipe stdout to stdin of next
          cmd+=" grep -iw '$i' |"
          # decrease count
          ((cnt--))
        # do if last argument
        else
          # no more piping
          cmd+=" grep -iw '$i'"
        fi
      done
      echo -e "$yellow \b$ "$cmd": $rs"
      eval "${cmd}"
      cmd+=" -c"
      echo -e "$yellow \b**** found $(eval "${cmd}") lines matching all \
      \b\b\b\b\b\b\b\bwords **** $rs"
    else
      # do if only one argument passed
      if [ -z "$2" ]; then
        # grep single argument for matching pattern; case-insensitive
        cmd="history | grep -i '$1'"
        echo -e "$yellow \b$ "$cmd": $rs"
        eval "${cmd}"
        cmd+=" -c"
        echo -e "$yellow \b**** found $(eval "${cmd}") lines with matching \
        \b\b\b\b\b\b\b\bpattern ****$rs"
      # do if additional paramters were passed
      else
        echo -e "$red\n \b **** unquoted spaces **** $rs"
        # display usage & examples
        echo "$(hs)"
      fi
    fi
  else
    echo -e "$yellow\n \busage: hs [pattern]"
    echo -e "usage: hs [+/=] [word] ['more words with spaces']\n"
    echo -e "example: $ hs sed              # single pattern search"
    echo -e "example: $ hs 'sed -e'         # quote wrap pattern if spaces"
    echo -e "example: $ hs + sed echo       # multiterm:OR; space separated"
    echo -e "example: $ hs + 'sed -e' echo  # lines matching any"
    echo -e "example: $ hs = 'sed -e' echo  # multiterm:AND; lines matching"
    echo -e "example: $ hs + win            # limit word match, not pattern$rs"
  fi
}
