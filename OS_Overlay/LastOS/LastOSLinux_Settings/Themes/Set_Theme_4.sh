#!/bin/bash

wine regedit /s ./Theme_4_Wine.reg

cp -rf ./Theme_4_Overlay/. $HOME/

#Transparent Panels
dconf write /org/cinnamon/enabled-extensions "['transparent-panels@germanfr']"

#Set Clock to 12H not 24H
gsettings set org.cinnamon.desktop.interface clock-use-24h false

#Set Wallpaper
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/lastos/Wallpaper.jpg'

#Set Login Background
gsettings set x.dm.slick-greeter background '/usr/share/backgrounds/lastos/Login.jpg'

#Desktop Icons
gsettings set org.nemo.desktop computer-icon-visible true
gsettings set org.nemo.desktop trash-icon-visible true

#Panel To Top
gsettings set org.cinnamon panels-enabled "['1:0:top']"

#Panel to Left (Instead of Menu etc being far centered)
dconf write /org/cinnamon/enabled-applets "['panel1:left:0:menu@cinnamon.org:0', 'panel1:left:1:separator@cinnamon.org:1', 'panel1:left:2:grouped-window-list@cinnamon.org:2', 'panel1:right:0:systray@cinnamon.org:3', 'panel1:right:1:xapp-status@cinnamon.org:4', 'panel1:right:2:notifications@cinnamon.org:5', 'panel1:right:3:printers@cinnamon.org:6', 'panel1:right:4:removable-drives@cinnamon.org:7', 'panel1:right:5:keyboard@cinnamon.org:8', 'panel1:right:6:favorites@cinnamon.org:9', 'panel1:right:7:network@cinnamon.org:10', 'panel1:right:8:sound@cinnamon.org:11', 'panel1:right:9:power@cinnamon.org:12', 'panel1:right:10:calendar@cinnamon.org:13', 'panel1:right:11:cornerbar@cinnamon.org:14']"

#Buttons To Right
gsettings set org.cinnamon.desktop.wm.preferences button-layout "':minimize,maximize,close'"

#Icon Theme
gsettings set org.cinnamon.desktop.interface icon-theme "Windows-10-master"

#Set Dark Theme
gsettings set org.cinnamon.desktop.interface gtk-theme "LastOS-Orchis-Dark-Compact"
gsettings set org.cinnamon.theme name "LastOS-Orchis-Dark-Compact"
gsettings set org.gnome.desktop.interface gtk-theme "LastOS-Orchis-Dark-Compact"
gsettings set org.x.apps.portal color-scheme "prefer-dark"

#Set White Mouse Cursor
gsettings set org.cinnamon.desktop.interface cursor-theme "DMZ-White"
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"
gsettings set x.dm.slick-greeter cursor-theme-name "DMZ-White"

#Change Main Menu icon to LastOS
cd $HOME/.config/cinnamon/spices/menu@cinnamon.org/
grep -lZ '"value": "linuxmint-logo-ring-symbolic"' 0.json | xargs -0 sed -i 's|"value": "linuxmint-logo-ring-symbolic"|"value": "/usr/share/icons/Start Button.png"|g'

#Restart Desktop (Let Icon Auto-Arrange be disable for this Session)
#nemo-desktop --quit
#nemo --no-default-window &
