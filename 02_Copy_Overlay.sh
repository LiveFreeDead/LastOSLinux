#!/bin/bash

##Microsoft Fonts (Needs EULA bypassed) Do this before I copy the windows versions over the top
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y ttf-mscorefonts-installer

mkdir -m a=rwx $HOME/Overlay

#Extract Icons First so can replace
sudo 7z x -y Extras/Windows-10-master.zip -o/usr/share/icons
sudo chmod -R 755 /usr/share/icons/Windows-10-master

#Extract SymLinks
sudo tar -xf Extras/SymLinks.tar -C /

#Delete Previous Overlay for LastOS folder so I can apply changes to previous built OS's, May add skel to this eventually
sudo rm -rf "/LastOS"

# 777 Everyone full access, 775 gives everyone read access only, root and owner get RWX
sudo cp -rf OS_Overlay/* $HOME/Overlay
sudo chmod -R 775 $HOME/Overlay

sudo chmod 775 "$HOME/Overlay/etc/skel/.config/autostart/First Logon.desktop"
sudo chmod 775 "$HOME/Overlay/LastOS/Scripts/firstlogon.sh"

sudo chmod 775 "$HOME/Overlay/LastOS/Scripts/*.sh"

sudo chmod +x "$HOME/Overlay/etc/skel/.config/autostart/First Logon.desktop"
sudo chmod +x "$HOME/Overlay/LastOS/Scripts/firstlogon.sh"

sudo chmod +x "$HOME/Overlay/LastOS/Scripts/*.sh"

#Set /LastOS folder for everyone
sudo chmod -R a+rwx "$HOME/Overlay/LastOS"

#Copy the repaird Overlay to the root of the filesystem: the -a should be recursive and keep permissions etc
sudo cp -a $HOME/Overlay/* /

#Clone the cache to the current user so that MONO and GECKO is there for WINE and icoextract-thumbnailer is installed
cp -rf $HOME/Overlay/etc/skel/.cache/* /$HOME/.cache
cp -rf $HOME/Overlay/etc/skel/.config/* /$HOME/.config
cp -rf $HOME/Overlay/etc/skel/.local/* /$HOME/.local

#Remove Config files that we don't want on the current install (Mainly the First Logon.desktop)'
sudo rm -f "$HOME/.config/autostart/First Logon.desktop"

#Delete the Overlay folder now as we don't need it and I don't need to change the ownership of it below
sudo rm -r $HOME/Overlay

#Just own the whole folder (I am the user of my folder after all)
sudo chmod -R 775 "$HOME"
sudo chown -Rc $USER:$USER "$HOME"

#Fix permissions to /lib folder (Firewall needs this set)
sudo chmod 755 /lib

#Fix /LastOS Ownership (775 might be enough, but I'll go 777 as I want all users to access this folder)
#Chown Sets it to User ID 1000 (All Users)
sudo chmod -R 777 "/LastOS"
sudo chown -f -Rc $USER:$USER "/LastOS"
sudo chown -f -R :users "/LastOS"

#Make the sudo service executable and not editable by users
sudo chmod 755 "/LastOS/Scripts/sudo_firstlogon_service.sh"
#sudo chmod 775 "/LastOS/Scripts/sudo_firstlogon_service.sh"
#sudo chown root:root "/LastOS/Scripts/sudo_firstlogon_service.sh"
sudo chmod +x "/LastOS/Scripts/sudo_firstlogon_service.sh"

#Rebuild Fonts
sudo fc-cache -f -v
fc-cache -f -v

#Add LastOS File Types for LLApp/Game files
./Tools/AddLastOSFileTypes.sh
