# My Dotfiles

**Notes:**

Bash:
  - bash_profile needs to be symlinked inside root of home
  - bash_profile sources dotfiles/bash/*.sh (except profile.sh)
  - .sh extension used to enable syntax highlighting in text editor

~~~~
# check for existing bash_profile; backup if exists
if [ -f ~/.bash_profile ]; then
  mv .bash_profile .bash_profile_old
fi

# create symlink at root of home
ln -sf ~/src/config/dotfiles/bash/profile.sh ~/.bash_profile
~~~~

Git:
  - gitconfig needs to be symlinked inside root of home
  - global gitignore file specified inside gitconfig

~~~~
# create symlink at root of home
ln -sf ~/src/config/dotfiles/git/gitconfig ~/.gitconfig
~~~~


Atom:
  - following files needs to be symlinked inside root of ~/.atom
    - config.cson
    - init.coffee
    - keymap.cson
    - projects.cson
    - snippets.cson
    - styles.less

~~~~
# create symlinks at root of home
ln -sf ~/src/config/dotfiles/atom/* ~/.atom/
~~~~

**Roadmap:**

- Roll own git aware prompt, then remove (bash-git-prompt)
    - branch icon/name
    - dirty symbols
    - forward/behind arrows
- Clean up functions.sh
    - Switch conditionals to case statements where appropriate
    - Scratch function: add shift/unshift parameters
    - Add function to copy output of last command to pbcopy
    - Add function to copy last command to pbcopy
    - Move larger functions to standalone scripts to reduce memory
- Finish commenting gitconfig
- Add tutorial with screenshots for repo cloning, forking, integrating & customizing

**Feel free to fork, but YMMV!**
