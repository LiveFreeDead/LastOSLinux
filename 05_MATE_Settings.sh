#!/bin/bash

#MATE Settings

gsettings set org.mate.interface gtk-theme "LastOS-Orchis-Dark-Compact"

gsettings set org.mate.Marco.general theme "LastOS-Orchis-Dark-Compact"

gsettings set org.mate.interface icon-theme "Windows-10-master"

gsettings set org.mate.peripherals-mouse cursor-theme "DMZ-White"

gsettings set com.linuxmint.mintmenu applet-icon "/usr/share/icons/Start Button MATE.png"

gsettings set org.mate.caja.desktop computer-icon-visible true

gsettings set org.mate.caja.desktop trash-icon-visible true

#Sleep timers
#gsettings set org.mate.power-manager sleep-computer-ac 1800
gsettings set org.mate.power-manager sleep-display-ac 1200

#gsettings set org.mate.power-manager sleep-computer-battery 180
gsettings set org.mate.power-manager sleep-display-battery 120

#Screensaver
gsettings set org.mate.session idle-delay 20


#Root user Settings

sudo gsettings set org.mate.interface gtk-theme "LastOS-Orchis-Dark-Compact"

sudo gsettings set org.mate.Marco.general theme "LastOS-Orchis-Dark-Compact"

sudo gsettings set org.mate.interface icon-theme "Windows-10-master"

sudo gsettings set org.mate.peripherals-mouse cursor-theme "DMZ-White"

sudo gsettings set com.linuxmint.mintmenu applet-icon "/usr/share/icons/Start Button MATE.png"

sudo gsettings set org.mate.caja.desktop computer-icon-visible true

sudo gsettings set org.mate.caja.desktop trash-icon-visible true


##Below isn't needed in the Main Builder, just the Sprinkles or Topping installs.
#
##MATE Overlay SUDO
#
#mkdir -p $HOME/Overlay
#
#sudo cp -rf OS_Overlay/* $HOME/Overlay
#sudo chmod -R 775 $HOME/Overlay
#
##Copy the repaird Overlay to the root of the filesystem: the -a should be recursive and keep permissions etc
#sudo cp -a $HOME/Overlay/* /
#
##Clone the cache to the current user and skel
#cp -rf $HOME/Overlay/etc/skel/.cache/* /$HOME/.cache
#cp -rf $HOME/Overlay/etc/skel/.config/* /$HOME/.config
#cp -rf $HOME/Overlay/etc/skel/.local/* /$HOME/.local
#cp -rf $HOME/Overlay/etc/skel/.themes/* /$HOME/.themes
#
##copy skel to root user so default scripts are in context menu etc
#sudo cp -rf /etc/skel/* /root
#
##Delete the Overlay folder now as we don't need it and I don't need to change the ownership of it below
#sudo rm -r $HOME/Overlay
#
##Just own the whole folder (I am the user of my folder after all)
#sudo chmod -R 775 "$HOME"
#sudo chown -Rc $USER:$USER "$HOME"


