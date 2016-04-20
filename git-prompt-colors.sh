
  #######################################################
  ##  filename: git-prompt-colors.sh                   ##
  ##  path:     ~/src/config/dotfiles/                 ##
  ##  symlink:  ~/                                     ##
  ##  purpose:  bash-git-prompt theme template         ##
  ##  date:     12/04/2015                             ##
  ##  repo:     https://github.com/WebAppNut/dotfiles  ##
  #######################################################

# notes:
# ● ✕ ✛ ፨ ⋶  ± … ≡ ≣ ≋ ⁻ ⁺ ⁼                 # extra unicode icons

prompt_callback() {
  # purpose: override default prompt_callback
  gp_set_window_title ${PWD/#${HOME}/\~}      # xterm title: pwd short = ~/
  scratch                                     # refresh scratch count
}

# editor needs to use a patched powerline font to render correctly
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="waf"                 # theme name
  GIT_PROMPT_LEADING_SPACE=0                  # no leading space before prompt
  GIT_PROMPT_PREFIX=" "                      # git info string: start
  GIT_PROMPT_SUFFIX=" "                       # git info string: end
  GIT_PROMPT_SEPARATOR=""                     # separates each item
  GIT_PROMPT_STAGED="\[$green\] ⁺"            # staged file icon/count
  GIT_PROMPT_CONFLICTS="\[$red\] ᶜ"           # file conflict icon/count
  GIT_PROMPT_CHANGED="\[$yellow\] ᵐ"          # modified file icon/count
  GIT_PROMPT_UNTRACKED="\[$yellow\] ᵘ"        # untracked file icon/count
  GIT_PROMPT_STASHED="\[$yellow\] ˢ"          # stashed file icon/count
  GIT_PROMPT_CLEAN=""                         # clean icon/count
  GIT_PROMPT_BRANCH=" "                      # branch icon/count
  GIT_PROMPT_SYMBOLS_AHEAD="↑·"               # versions ahead
  GIT_PROMPT_SYMBOLS_BEHIND="↓·"              # versions behind
  GIT_PROMPT_SYMBOLS_PREHASH=":"              # before hash
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=" "   # no remote tracking icon
  # GIT_PROMPT_REMOTE=" "                     # remote branch icon: ahead/behind
  # GIT_PROMPT_UPSTREAM="⋶"                   # remote tracking icon
  # GIT_PROMPT_COMMAND_OK="\[$green\]✔"       # git command icon: success
  # GIT_PROMPT_COMMAND_FAIL="\[$red\]✘"       # git command icon: failure

  GIT_PROMPT_START_USER=""                    # pre-prompt
  GIT_PROMPT_END_USER="$PS1"                  # use bash prompt
  # GIT_PROMPT_END_USER="\[$blue\]${PathShort} "              # pwd short = ~/
  # GIT_PROMPT_END_USER+="\[$yellow\]"                        # set color
  # GIT_PROMPT_END_USER+="\$([ \$sc -gt 0 ] && echo ⁼\$sc\ )" # scratch icon/count
  # GIT_PROMPT_END_USER+="\$([ \j -gt 0 ] && echo *\j\ )"     # job icon/count
  # GIT_PROMPT_END_USER+="\[$red\]❯\[$yellow\]❯\[$green\]❯"   # colored chevrons
  # GIT_PROMPT_END_USER+="\[$rs\] "                           # reset color
  # GIT_PROMPT_END_ROOT="${BoldRed} # "                     # root prompt
}

reload_git_prompt_colors "waf"
