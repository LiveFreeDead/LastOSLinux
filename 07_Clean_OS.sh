#!/bin/bash

sudo apt --fix-broken install -y
sudo apt autoremove --yes

#Clear the Cache of downloaded .deb files, safe
sudo apt-get clean

#Clear the trash
#trash-empty
gio trash --empty

#Run eggs cleaner before I do the skel copy, may fix the apt issue? Will cause issues with apt (but fix now added below)
sudo eggs tools clean -n

sudo apt update -y

#Cleanup extras

#Recent Files
rm $HOME/.local/share/recently-used.xbel
touch $HOME/.local/share/recently-used.xbel

#Bash
history -cw

#Temp
sudo rm -rf /tmp/*

#Skipped as I don't keep /var in the install image'
##logs, cat will empty the active files, then delete them shouldn't hurt as it's kb of data'
#cat /dev/null > /var/log/syslog
#cat /dev/null > /var/log/kern.log
#sudo rm -rf /var/log/*

#Rotate Logs (Remove old logs)
sudo logrotate --force  /etc/logrotate.d/ 2>/dev/null

#Delete Firefox profile and cache
rm -rf $HOME/.mozilla
rm -rf $HOME/.cache/mozilla

#Others
rm $HOME/.xsession-errors
touch $HOME/.xsession-errors
rm $HOME/.xsession-errors.old
rm $HOME/.sudo_as_admin_successful

