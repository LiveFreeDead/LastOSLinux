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

#Set scripts etc to executable (Not sure this works, but worth a try)
chmod +x /home/eggs/iso/MakeUSB.sh
chmod +x /home/eggs/iso/USB_Overlay/LLTek/Ventoy/*.sh
chmod +x /home/eggs/iso/USB_Overlay/LLTek/Ventoy/VentoyGUI.x86_64
chmod +x /home/eggs/iso/USB_Overlay/LLTek/Ventoy/VentoyGUI.i386
chmod +x /home/eggs/iso/USB_Overlay/LLTek/Ventoy/VentoyGUI.aarch64
chmod +x /home/eggs/iso/USB_Overlay/LLTek/Ventoy/VentoyGUI.mips64el

#Rename the ISO internal name from "-V3.0" and Linux To LastOSLinux
sudo grep -lZ '"-V3.0"' /home/eggs/ovarium/mkisofs | sudo xargs -0 sed -i 's|"-V3.0"|"LastOSLinux"|g'
sudo grep -lZ 'Linux' /home/eggs/ovarium/mkisofs | sudo xargs -0 sed -i 's|-V Linux|-V LastOSLinux|g'

#The scripts go to home/eggs/ovarium/

#Copy the new calamares confgis, This is now only required to customize things, sudo eggs calamares in prepare script copy required files.
if [ -d "OS_Overlay/etc/calamares/modules" ] ; then
sudo cp -f OS_Overlay/etc/calamares/modules/* /etc/calamares/modules
sudo chmod -R 755 /etc/calamares/modules/*
fi
if [ -d "OS_Overlay/etc/calamares/calamares-modules" ] ; then
sudo cp -rf OS_Overlay/etc/calamares/calamares-modules /etc/calamares
sudo chmod -R 755 /etc/calamares/calamares-modules/*
fi
#Wait For Key Press, if needed
#read -rsn1 -p "Press a Key to capture..." ; echo

#Make SquishFS (Compressed OS image)
echo Make SquashFS...
sudo Tools/Egg3-mksquishfs.sh

sudo Tools/Egg4-UnBind.sh

#Make ISO and open folder to it
echo Make ISO...
sudo Tools/Egg5-Make_ISO.sh

#Open the folder as root (ISO is only avaialble to root user) The & at the end should hopefully exist the terminal and keep root nemo running.
sudo Tools/Egg2-Open_Mount_as_Root.sh
