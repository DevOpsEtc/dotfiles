#######################################################
##  filename: aliases.sh                             ##
##  path:     ~/src/config/dotfiles/bash/            ##
##  purpose:  bash command aliases                   ##
##  date:     05/21/2016                             ##
##  note:     sourced via bash_profile               ##
##  repo:     https://github.com/WebAppNut/dotfiles  ##
#######################################################

## ru aliases ############################################################
alias rup='. $cfg/provision/osx_ru.sh' # check-in for RU repo updates
alias gbc='cd $trn/ru; ls -ahF'
alias gbd='cd $trn/ru/_private/ru_repos/May2016DemoCode; ls -ahF'
alias gbe='cd $trn/ru/work/exercises; ls -ahF'
alias gbp='cd $trn/ru/work/projects; ls -ahF'
alias gbes='cd $trn/ru/_private/ru_repos/exercise-starters; ls -ahF'
alias gbec='cd $trn/ru/_private/ru_repos/exercise-solutions; ls -ahF'

## goto folder aliases ###################################################
alias gsrc='cd $src; ls -ahF'
alias gcht='cd $src/cheats; ls -ahF'
alias gtrn='cd $src/training; ls -ahF'
alias gpro='cd $cfg/provision; ls -ahF'
alias gbin='cd $cfg/bin; ls -ahF'
alias gdot='cd $cfg/dotfiles; ls -ahF'

## misc aliases ##########################################################
alias ..='cd ..'                            # cd up 1 level
alias ..2='cd ../..'                        # cd up 2 levels
alias ..3='cd ../../..'                     # cd up 3 levels
alias ..4='cd ../../../..'                  # cd up 4 levels
alias al='alias_list'                       # show all loaded aliases; [term]
alias fp000='chmod a-rwx'                   # strip all file perms
alias fp644='chmod go+r,u+rw'               # set file perms to 644
alias fp755='chmod go+rx,u+rwx'             # set file perms to 755
alias fpax='chmod a+x'                      # make executable
alias bak='backup'                          # backup(); [dir/file]
alias c='clear'                             # clear screen
alias ch='cheat'                            # search for term in note file
alias cp='cp -iv'                           # copy; confirm; verbose
alias cpwd="pwd | tr -d '\n' |pbcopy"       # copy working directory path
alias ci="fc -ln -1 | tr -d '\n' |pbcopy"   # copy last command
# alias cop="!! | pbcopy" 	                    # copy output of last command
# turn into function:
# alias co='fc -ln -1 | awk '\''{$1=$1}1'\'' | pbcopy'
alias dns-f='dscacheutil -flushcache'       # flush dns cache
alias emv='set -o vi; echo "vi mode"'       # set edit mode to vi
alias eme='set -o emacs; echo "emacs mode"' # set edit mode to emacs (default)
alias f='open -a finder $PWD'               # open $PWD in osx finder; [folder]
alias fs='find . -name'                     # filename search [folder/file]
alias func='declare -F'                     # see list of active functions
alias funcf='declare -f'                    # see active functions
alias g='git'                               # run git binary
alias gk='gitk --all'                       # run git repo browser
alias h='history'                           # list command history
alias hr='history_remove'                   # remove line(s) from history
alias hs='history_search'                   # search command history [term]
alias ip='curl ip.appspot.com'              # list public facing ip address
alias kb='key_backup.sh'                    # invoke backup script
alias l.='ls -dAF .[^.]*'                   # ls only dotfiles
alias l='ls -fF'                            # list all; no sort; link=/, dir=@
alias ld='ls -dA */'                        # ls only dirs
alias ll='ls_octal -f'                      # ls -l + octal perms (contents)
alias lld='ls_octal -d'                     # ls -l + octal perms (dir)
alias lt='ls -Altr'                         # sort by date (latest @bottom)
alias lz='ls -AlShr'                        # sort by size (largest @bottom)
alias ln='ln -v'                            # link creation with verbose switch
alias m0='make_empty_file'                  # mkfile [number] [size]
alias mv='mv -iv'                           # move; confirm; verbose
alias path='echo -e ${PATH//:/\\n}'         # list all executable paths
alias ping='ping -c3'                       # limit ping to 3 attempts
alias R='. $HOME/.bash_profile'             # source .bash_profile
alias rm='rm -iv'                           # remove; confirm; verbose
alias s='scratch'                           # create temporary note; hud in ps1
alias ver='sw_vers'                         # check osx version
alias tag='cd ~/src && ctags -R -f .tags'   # generate ctag file with symbols
alias tage='atom -nw $src/.tags'            # edit .tags file
alias which='which -a'                      # find executable [app] instances
alias wk='work.sh'                          # invoke bettersnaptool snap script

# disabled aliases for tools and projects no longer use
## ansible aliases #######################################################
# alias avl='ansible-vault edit $p_vl'        # decrypt & edit vault_local.yml
# alias avs='ansible-vault edit $p_vs'        # decrypt & edit vault_server.yml
# alias ave='ansible-vault encrypt'           # add file encryption [path/file]
# alias avd='ansible-vault decrypt'           # remove file encryption [path/file]
# alias apl='$c_ap -l local -K $c_ap2 -vvv'   # run playbook host-limited: local
# alias apd='$c_ap -l dev $c_ap2 -vvv'        # run playbook host-limited: dev
# alias aps='$c_ap -l stage $c_ap2 -vvv'      # run playbook host-limited: stage
# alias app='$c_ap -l prod $c_ap2 -vvv'       # run playbook host-limited: prod
# alias aplm='$apd -t mod'                    # run dev play with tag: mod
# alias aplr='$apd -t reset'                  # run dev play with tag: reset
# alias aal='ansible -i $p_inv local -a'      # run adhoc command: local [command]
# alias aad='ansible -i $p_inv dev -a'        # run adhoc command: dev [command]
# alias aas='ansible -i $p_inv stage -a'      # run adhoc command: stage [command]
# alias aap='ansible -i $p_inv prod -a'       # run adhoc command: prod [command]
# alias aaP='ansible -i $p_inv all -m ping'   # run adhoc ping: all

## docker aliases ########################################################
# alias d='docker'                           # docker binary
# alias dx='docker exec -it'                 # run command on container [name]
# alias dl='docker logs'                     # list container log [name] [-f]
# alias dps='docker ps'                      # list containers (running)
# alias dpsa='docker ps -a | grep Exited'    # list containers (exited)
# alias dpsq='docker ps -q' 				         # list container IDs (running)
# alias dpsaq='docker ps -aq'                # list container IDs (all)
# alias drel='docker_releases.sh'            # download latest docker releases
# alias dst='docker stats $(docker ps -q)'   # container memory/cpu usage
# alias dip='docker_get_ip'                  # list container IP [name]
# alias dgo='docker_go_container'            # open container cli
# alias din='docker inspect'                 # list container/image info [name]
# alias dim='docker images'                  # list images
# alias drmi='docker_rm_image'               # delete image [name]
# alias drmia='docker rmi $(docker images -q)' # delete all images
# alias drmc='docker kill $(docker ps -aq) && docker rm $(docker ps -aq)'
# alias dnuke='docker_rm_atomic'             # stop/delete all containers/images

## docker-compose aliases ################################################
# alias dc='docker-compose'                  # docker-compose binary
# alias dcup='docker-compose up -d'          # build services & run containers
# alias dcb='docker-compose build'		       # (re)build service image [Name]
# alias dcr='docker-compose restart'	       # restart all containers
# alias dcon='docker-compose start'	         # start container(s) [Name]
# alias dcof='docker-compose stop'	         # start all containers
# alias dcps='docker-compose ps'	           # list docker-compose services
# alias dcl='docker-compose logs'            # list service logs w/ tail -f

## docker-machine aliases ################################################
# alias dm='docker-machine'                  # docker-machine binary
# alias dma='docker-machine active'          # list machines (active)
# alias dmas='machine_set_active'            # set active machine; opt [mach_name]
# alias dmgo='machine_go'                    # ssh into machine; opt [mach_name]
# alias dmip='machine_get_ip'                # get machine ip; opt [mach_name]
# alias dmls='docker-machine ls'			       # list machines (all)
# alias dmrm='docker-machine rm'             # remove machine; opt [mach_name]
# alias dmr='machine_restart'                # restart machine; opt [mach_name]
# alias dmon='machine_start'                 # restart machine; opt [mach_name]
# alias dmof='machine_stop'                  # restart machine; opt [mach_name]

## drush aliases #########################################################
# alias dxd='docker exec -it tool drush'     # run drush on waf.dev
# alias dxd-c='dxd cache-rebuild'            # clear all drupal 8 caches
# # open one-time login link for specified user; uid 1=default
# alias dxd-l="dxd user-login | pbcopy && open $(pbpaste)"
# alias dxd-m='drupal_maintenance && dxd-c'  # toggle maintenance mode on/off

## tumx aliases ##########################################################
# alias w1='tmux_workspace.sh'                # attach to session; create if none
# alias w1d='tmux detach'                     # detach tmux session
# alias w1k='killall tmux'                    # kill tmux session

## vagrant aliases #######################################################
# silence & push to bg; ssh to vm
# alias vuwaf='gwaf && vagrant rsync-back > /dev/null && vagrant rsync-auto > /dev/null & ssh waf && fg'
# rsync host to guest
# alias synca='vagrant rsync-auto > /dev/null && fg'
# alias syncb='vagrant rsync-back'            # one-shot rsync from guest to host
# alias vst='vagrant status'                  # run from vagrant project directory
# alias vup='vagrant up'                      # "
# alias vpro='vagrant provision'              # "
# alias vhal='vagrant halt'                   # "
# alias vrel='vagrant reload'                 # "
# alias vssh='vagrant ssh'                    # "
# alias vkil='vagrant destroy'                # "
# alias vsus='vagrant suspend'                # "
# alias vres='vagrant resume'                 # "
# alias vbls='VBoxManage list runningvms'     # list names of running VBox boxes
# alias vbup='vbox_start'                     # manually start vbox
