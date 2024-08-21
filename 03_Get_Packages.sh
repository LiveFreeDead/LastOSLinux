#!/bin/bash

##Add Repo's
#FastFetch
sudo add-apt-repository --yes ppa:zhangsongcui3371/fastfetch

#Grub Customizer PPA
sudo add-apt-repository --yes ppa:danielrichter2007/grub-customizer

#Gambas Repo
sudo add-apt-repository --yes ppa:gambas-team/gambas3

#handbreak (Using Flatpak as I want to enable FlatPak and I don't like this repo, shows errors)
#sudo add-apt-repository --yes ppa:stebbins/handbrake-releases

##Brave Browser - Bad Repo, tries to use i386 and causes an error to show
#sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg #https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
#echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] #https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

#Update Source List after adding New Repo's
sudo apt-get -qq update -y

#Get Apps and Games 
#To Get Proton working - Steam needs to be ran and logged in, then you need to add a game and configure a game to use Proton compatability, then you can right click a .exe and open it with proton using that games configurations)
sudo apt install -y steam protontricks lutris playonlinux ffmpeg mint-meta-codecs vlc trash-cli grub-customizer notepadqq bleachbit cpu-x flameshot gparted htop jstest-gtk simplescreenrecorder obs-studio rar unrar filezilla catfish okular qbittorrent uget dconf-editor meld xfburn asunder qpdfview mediainfo-gui audacity kmahjongg kmines kpat ksudoku lbreakout2 kid3 ffmpegthumbs remmina darktable rapid-photo-downloader pdfarranger geany soundconverter cherrytree retext stacer plank makeself archivemount gambas3 fastfetch dos2unix

#krita <-This needs resources, so not including it as default

#Nemo Customised
sudo apt install -y nemo-media-columns
# Nemo Terminal is for advanced users, quite handy for me though
#nemo-terminal

#Install qemu tools so mounting VHD's works
sudo apt install -y qemu-utils nbd-client

#Install Samba so Windows Network shares are accessible
sudo apt install -y samba wsdd 

#These ones aren't in mint v22 yet, so exclude from main list for now
sudo apt install -y pinta isomaster brave-browser

#solarr is Logitec mouse pairing and Battery Level indicator (Handy but a extra Sys Tray Icon)
#kazam parcellite solaar 

#Google Chrome (This self updates and is better than the flatpak stuff from the repository)
if ! [ -f "google-chrome-stable_current_amd64.deb" ] ; then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb	
fi
sudo apt install -y ./google-chrome-stable_current_amd64.deb

##AIMP (I use this instead of a ppApp to initilize the older WINE so that any MINT system configs are in place prior to installing the newer WINE from the PPA
cp debs/aimp_5.30-2549_amd64.deb $HOME/aimp.deb
sudo chmod 777 $HOME/aimp.deb
sudo apt install -y $HOME/aimp.deb
sudo rm -f $HOME/aimp.deb

#DeadBeef Music Player
cp debs/deadbeef-static_1.9.6-1_amd64.deb $HOME/deadbeef.deb
sudo chmod 777 $HOME/deadbeef.deb
sudo apt install -y $HOME/deadbeef.deb
sudo rm -f $HOME/deadbeef.deb

#Handbreak, This is very large, This will auto download components in needs via updates (nVidia Module if have that GFX card), Disabled, too large, it's in the Store
#flatpak install -y flathub fr.handbrake.ghb

#Install Mission Control (Process Monitor), large I'll stick with gnome-system-monitor
#flatpak install -y https://flathub.org/repo/appstream/io.missioncenter.MissionCenter.flatpakref

################################## Remove Some Packages #################################
sudo apt -y remove transmission-gtk 

