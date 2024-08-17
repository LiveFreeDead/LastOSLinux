#!/bin/bash

#Need to remove Bookmarks file so capture works for Live user and newly created users:
sudo rm $HOME/.config/gtk-3.0/bookmarks

#Hide Hidden Files By Default
gsettings set org.nemo.preferences show-hidden-files false

##Due to the bug in having dual iso creators, this temp fix makes it work (No Longer needed)
#sudo apt purge -y genisoimage

#Clones Only the OS, no users kept
sudo eggs produce  --excludes static --release --script --noicon --links LastOS-ReadMe -n

sudo Tools/Egg1-Bind.sh

#Copy the ISO_Overlay to ISO
echo Copying Overlay, wait...
sudo cp -R ISO_Overlay/* /home/eggs/iso

#Rename the ISO internal name from "-V3.0" and Linux To LastOSLinux
sudo grep -lZ '"-V3.0"' /home/eggs/ovarium/mkisofs | sudo xargs -0 sed -i 's|"-V3.0"|"LastOSLinux"|g'
sudo grep -lZ 'Linux' /home/eggs/ovarium/mkisofs | sudo xargs -0 sed -i 's|-V Linux|-V LastOSLinux|g'

#Copy the new calamares confgis, This is now only required to customize things, sudo eggs calamares in prepare script copy required files.
sudo cp -f OS_Overlay/etc/calamares/modules/* /etc/calamares/modules
sudo chmod -R 755 /etc/calamares/modules/*
sudo cp -rf OS_Overlay/etc/calamares/calamares-modules /etc/calamares
sudo chmod -R 755 /etc/calamares/calamares-modules/*

#Do This Last as it holds up the terminal and script until you close the nemo window (I think the & should fix this)
sudo Tools/Egg2-Open_Mount_as_Root.sh
