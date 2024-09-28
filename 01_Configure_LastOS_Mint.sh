#!/bin/bash

#Make the error level 2 in grub (defaults to 4 in Ubuntu/Mint, 3 is recommended (2 Critical)(3 Error)(4 Warnings)
sudo grep -lZ 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"' /etc/default/grub| sudo xargs -0 sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"|GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=2 splash"|g'
sudo update-grub

#Need to overwrite the plymouth early or when penguin eggs generates the initramfs it will show mint's instead
sudo cp -rf OS_Overlay/usr/* /usr

#Build Plymouth so it's theme sticks
sudo update-initramfs -u -k all

#Change Host name
hostnamectl set-hostname LastOSLinuxLive

#Update repo's
sudo apt -qq update -y 
#sudo apt -qq upgrade -y 
sudo apt-get -qq upgrade -y 

#Fonts - thicker, the & at the end send the command to the background, so script can continue and it stays open when script ends.
sudo apt install -y fonts-ubuntu-classic
#This breaks font, I fix it in below script that keeps running (Desktop icons stay messed up until rebooted)
nohup ./Tools/RestartCinnamon.sh  > /dev/null 2>&1&

#Get Some Packages (Spice-VDAgent will allow the mouse to come out of the VM to the dekstop)
#VM Tools & Needed OS Tools used for building
#xclip allows copying to clipboard from scripts
#xdo allow things to be automated, much like how AutoIt has system API calls system wide, I use it in /usr/lib/pm-utils/sleep.d/999lastosvidfix
#sudo apt install -y spice-vdagent qemu-guest-agent
sudo apt install -y wget numlockx xclip xdotool yad
sudo apt install -y 7zip

#Removing sudo apt install -y spice-vdagent qemu-guest-agent as it seems to cause instabilities
sudo apt remove -y spice-vdagent qemu-guest-agent

#Adding vhd support using guestmount, also needs access to kernel folder which newer ubuntu's disabled.
sudo apt install -y libguestfs-tools
sudo chmod 0644 /boot/vmlinuz*

#turn on numlock
numlockx on

# Node > 18 is required from penguins-eggs
sudo apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo chmod +x nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs

##Download Eggs (I use local now)
#if ! [ -f "/tmp/eggsbasket.deb" ] ; then
#	wget --content-disposition https://downloads.sourceforge.net/project/penguins-eggs/DEBS/penguins-eggs_10.0.12-1_amd64.deb -O /tmp/eggsbasket.deb
#	sudo dpkg -i /tmp/eggsbasket.deb
#fi

#Just install local version
#sudo dpkg --purge penguins-eggs
sudo dpkg -i debs/penguins-eggs_10.0.38-1_amd64.deb
sudo apt --fix-broken install -y

#Install Calamares installer (It also configures it, but I do it later on as well just in case)
sudo eggs calamares -i

