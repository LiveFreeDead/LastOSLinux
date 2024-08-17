#!/bin/bash

##Add Repo's
#This requires you add i386 support to your linux, it's quite large, but required.
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
sudo apt-get update
sudo apt install --yes --install-recommends winehq-devel
#winehq-devel
#winehq-stable

#the OS_Overlay\etc\skel\.cache\wine\wine-mono-x.x.x-x86.msi makes it not need to ask and download it, remember to copy to current user.

#For mint only (also exe-thumbnailer is renamed to icoextract-thumbnailer in debian but doesn't seem to work
#wine-desktop-files
sudo apt install --yes wine-desktop-files exe-thumbnailer 

#We Need Wine Mono for it to be silent for current user
mkdir -p $HOME/.cache/wine 2>/dev/null
cp -f OS_Overlay/etc/skel/.cache/wine/* $HOME/.cache/wine

##Install .desktop files and some icons (Built in to Mint Repo, done above)
#sudo dpkg -i debs/wine-desktop-files_5.0.3_all.deb

#setup wine for current user (silently from MONO etc above)
wine wineboot
