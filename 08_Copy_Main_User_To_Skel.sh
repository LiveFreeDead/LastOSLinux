#!/bin/bash

#Hide Hidden Files By Default
gsettings set org.nemo.preferences show-hidden-files false

sudo mkdir /etc/skel/.config/

#Remove the users bookmarks as it hardcodes links in the file (this is for live user (TEST IF NEEDED for Live OS)
sudo rm -f $HOME/.config/gtk-3.0/bookmarks

#copy whole lot and remove ones that break things
sudo cp -R $HOME/.config/* /etc/skel/.config/

#Remove the whole folder
### $HOME/.config/gtk-3.0/gtk.css <-First Logon creates this
sudo rm -f /etc/skel/.config/gtk-3.0/bookmarks
sudo rm -Rf /etc/skel/.config/gtk-3.0

sudo rm -f /etc/skel/.config/user-dirs.dirs
sudo rm -f /etc/skel/.config/user-dirs.locale

#Testing this works to remove hardcoded links in said file :)
sudo rm -f /etc/skel/.config/menus/cinnamon-applications-merged

#Correct the permissions for skel (needs RW for root, RW for users and Access for non user)
sudo chmod -R 775 /etc/skel
