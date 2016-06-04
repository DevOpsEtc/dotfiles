#######################################################
##  filename: functions.sh                           ##
##  path:     ~/src/config/dotfiles/bash/            ##
##  purpose:  bash shell functions                   ##
##  date:     06/04/2016                             ##
##  note:     sourced via bash_profile               ##
##  repo:     https://github.com/WebAppNut/dotfiles  ##
##  source:   sourced by bash_profile                ##
#######################################################

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
      word or another ****"
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
      words ****"
    else
      # do if only one argument passed
      if [ -z "$2" ]; then
        # grep single argument for matching pattern; case-insensitive
        cmd="history | grep -i '$1'"
        echo -e "$yellow \b$ "$cmd": $rs"
        eval "${cmd}"
        cmd+=" -c"
        echo -e "$yellow \b**** found $(eval "${cmd}") lines with matching \
        pattern ****"
      # do if additional paramters were passed
      else
        echo -e "$red\n \b **** unquoted spaces **** $rs"
        # display usage & examples
        echo "$(hs)"
      fi
    fi
  else
    echo -e "$yellow\n \busage: hs [pattern]"
    echo -e "$yellow \busage: hs [+/=] [word] ['more words with spaces']\n"
    echo -e "example: $ hs sed              # single pattern search"
    echo -e "example: $ hs 'sed -e'         # quote wrap pattern if spaces"
    echo -e "example: $ hs + sed echo       # multiterm:OR; space separated"
    echo -e "example: $ hs + 'sed -e' echo  # lines matching any"
    echo -e "example: $ hs = 'sed -e' echo  # multiterm:AND; lines matching"
    echo -e "example: $ hs + win            # limit word match, not pattern"
  fi
}
ls_octal() {
  # long list showing octal permissions & symbolic
  # ran against $PWD if no optional [arg]
  ls -AlhF "$@" | awk '{k = 0; for (g=2; g>=0; g--) for (p=2; p>=0; p--) \
  {c = substr($1, 10 - (g * 3 + p), 1); if (c ~ /[sS]/) k += g * 02000; \
else if (c ~ /[tT]/) k += 01000; if (c ~ /[rwxts]/) k += 8^g * 2^p} \
  if (k) printf("%04o ", k);print;}'
}
make_empty_file() {
  # purpose: create empty file containing all zeros
  if [ ! -z "$1" ]; then
    tmp=$1_$2b.tmp
    echo -e "$green\n \bcreating empty $1 $2b file... \n$rs"
    mkfile $1$2 $1_$2b.tmp
    echo -e "$blue \bcreated: $PWD/$tmp\n \bsize: $(du -h $tmp | awk \
    '{ print $1 }') $rs"
  else
    echo -e "$red\n \busage: m0 [size] [b|k|m|g]"
    echo -e "example: $ m0 1 m"
  fi
}
cheat() {
  # purpose: display cheat or particular term inside cheat
  # do if no cheat argument passed
  if [ -z "$1" ]; then
    echo -e "$yellow\n \busage: [cheat] [keyword] [trailing_line_num] $rs"
    echo -e "$yellow\n \bexample: $ ch atom line 4 $rs"
  # do if number of trailing lines is blank; avoids invalid arg error
  elif [ -z "$3" ]; then
    grep -i "$2" -A0 ~/src/cheats/$1.txt | less -r
  else
    grep -i "$2" -A$3 ~/src/cheats/$1.txt
  fi
}
usb_clean() {
  # purpose: remove hidden files on usb drive for cleaner display on blu-ray/tv
  if [ ! -z $1 ]; then
    usb=/Volumes/$1
    rm -rf $usb/.{,_.}{_*,fseventsd,Spotlight-V*,Trashes}
    diskutil unmount $1
    echo -e "$blue\n \busb drive clean complete... safe to remove $rs"
  else
    echo -e "$yellow\n \busage: usb_clean [drive_name]"
    echo -e "available mounted usb drives: $(diskutil list | awk '/DOS_FAT/ \
    {print $3}') $rs"
  fi
}
scratch() {
  # purpose: store temporary notes in flat file; bash does not do env array
  # path to scratch file
  scratch=$HOME/src/.scratch
  # create scratch file if not already exists
  [ -f $scratch ] || touch $scratch
  scratch_count() {
    # purpose: count scratch entries
    sc=$(wc -l < $scratch | tr -d ' ')
  }
  case $1 in
    l|ls|list ) # list scratch item(s)
      scratch_count
      echo -e "$yellow\n \bScratch Items: $sc $rs"
      echo -e "$yellow\n \b$(cat $scratch) $rs"
      ;;
    o|open )  # edit scratch file
      open $scratch
      ;;
    rm|remove )  # clear scratch content; overide no clobber setting
      >| $scratch
      ;;
    pp|pop )  # copy last item (minus bullet) to clipboard; remove from list
      echo -n $(awk 'END{print substr($0, index($0, $2))}' $scratch) | pbcopy
      echo -e "$blue \bCopied to clipboard: $(pbpaste) $rs"
      sed -i '' '$d' $scratch
      ;;
    ps|push )  # add item to bottom of list
      if [ ! -z "$1" ]; then           # do if argument passed
        echo "- ${*:2}" >> $scratch # append final string to scratch
      fi
      ;;
    sh|shift ) # add scratch item to front of list
      ;;
    sp|splice ) # remove scratch item matching argument
      echo -n $(awk "/$2/ {gsub(\"- \", \"\"); print}" $scratch) | pbcopy
      echo -e "$blue \bCopied to clipboard: $(pbpaste) $rs"
      sed -i '' "/$2/d" $scratch
      ;;
    \?|help|man ) # display usage tips
      echo -e "$yellow\n \busage: s [words]"
      echo -e "example: $ s this is a note $rs"
      ;;
    *)  # if no argument passed, then just refresh count; called @PROMPT_COMMAND
      scratch_count
      ;;
    esac
}
tags() {
  # purpose: # generate ctags file filled with symbols from all ~/src/* projects
  case $1 in
    e|ed) atom $src/.tags;;  # edit
    l|ls) cat $src/.tags;;   # list
    r|rm) rm -f $src/.tags;; # remove
       *)
       init_pwd="$(pwd)"     # store pwd
       cd $src
       ctags -R --exclude=.git --exclude=_private -f .tags # generate
       cd $init_pwd;;        # goto initial pwd
  esac
}
