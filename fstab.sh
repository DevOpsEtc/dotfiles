########################################################################
##  filename: fstab.sh                                                ##
##  path:     ~/src/config/dotfiles/                                  ##
##  symlink:  /etc/fstab                                              ##
##  purpose:  file systems table                                      ##
##  date:     04/07/2015                                              ##
##  repo:     https://github.com/WebAppNut/dotfiles                   ##
##  notes:    diskutil info "/Volumes/backup-rm" | grep 'Volume UUID' ##
########################################################################

# backups-rs
UUID=4BF92D69-E240-3072-9D53-759ACECC1CF6 none hfs rw,noauto

# backups-tm
UUID=367069AF-8724-39B8-AE59-32FF04E30FE3 none hfs rw,noauto
