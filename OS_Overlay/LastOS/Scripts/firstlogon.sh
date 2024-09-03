#!/bin/bash

#Turn on NumLock by default for Live and the first time a user logs in
numlockx on

#Remove itself from first logon for current user
rm  "$HOME/.config/autostart/First Logon.desktop"

#Shrink TitleBar
echo 'headerbar {' > "$HOME/.config/gtk-3.0/gtk.css"
echo '   min-height: 22px;' >> "$HOME/.config/gtk-3.0/gtk.css"
echo '}' >> "$HOME/.config/gtk-3.0/gtk.css"


#Change Main Menu icon
cd $HOME/.config/cinnamon/spices/menu@cinnamon.org/
grep -lZ '"value": "linuxmint-logo-ring-symbolic"' 0.json | xargs -0 sed -i 's|"value": "linuxmint-logo-ring-symbolic"|"value": "/usr/share/icons/Start Button.png"|g'

######################### EXIT LIVE USER ##############################
#Exit if live user
if [ "$(whoami)" == "live" ]; then
	gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/lastos/LiveWallpaper.jpg'
    exit
fi

######################### SETUP NEW USER ##############################

#notify-send --hint=int:transient:1 -u critical -t 0 "Please wait while LastOS Installs some things..."
zenity --timeout 120 --info --text "Please wait while LastOS Installs some things..." &

#Replace Home Path in custom .desktop files for new users
cd $HOME/.local/share/applications/
grep -rlZ /home/user . | xargs -0 sed -i "s|/home/user|${HOME}|g"


##Place ssWPI on desktop so people can install other apps/games
#cp /LastOS/ssWPI_Installer.desktop $HOME/Desktop
#chmod +x "$HOME/Desktop/ssWPI_Installer.desktop"
#chmod +x "/LastOS/ssWPI_Installer.desktop"
#chmod +x "/LastOS/ssWPI_Installer.sh"

#Place all desktop file on desktop
cp /LastOS/*.desktop $HOME/Desktop
chmod +x "$HOME/Desktop/*.desktop"
chmod +x "/LastOS/*.desktop"
#chmod +x "/LastOS/ssWPI_Installer.sh"


#The fix for this is running sudo apt update -y just before running mksquashfs, leave here incase it come back, I'll also leave the service that runs as it is a failsafe.
#cp /LastOS/Fix_Apt_Cache_Needs_Internet $HOME/Desktop
#chmod +x "$HOME/Desktop/Fix_Apt_Cache_Needs_Internet"

#This should refresh the apt cache without sudo, fixing the red shield
#mintupdate-launcher &

#configure wine silently
wine wineboot

#Make a Link to WINE C Drive in Places/Bookmarks
grep -qF '/.wine/drive_c' ~/.config/gtk-3.0/bookmarks || echo file://$HOME/.wine/drive_c C:\\ \(Wine\) >> ~/.config/gtk-3.0/bookmarks

#Move Downloads to the top of the pinned items
grep "Downloads" ~/.config/gtk-3.0/bookmarks > out && grep -v "Downloads" ~/.config/gtk-3.0/bookmarks >> out && mv out ~/.config/gtk-3.0/bookmarks

#Install Vulkan to make Wine games run better
bash /LastOS/Scripts-Wine/vulkan/setup-vulkan.sh

#install SetupS
notify-send --hint=int:transient:1  "Please wait, Installing Windows App:" "/LastOS/Scripts-Wine/01_SetupS.SendTo.Suite_v24.05.22.0_ssApp.exe"
wine /LastOS/Scripts-Wine/01_SetupS.SendTo.Suite_v24.05.22.0_ssApp.exe

#install Apps
FILES="/LastOS/LinuxApps/*"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #notify-send --hint=int:transient:1  "Please wait, Installing Linux App:" "$f"
  #wine "$f"
  llapp -install "$f"
done

FILES="/LastOS/WindowsApps/*"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #notify-send --hint=int:transient:1  "Please wait, Installing Windows App:" "$f"
  #wine "$f"
  llapp -install "$f"
done

#install Games
FILES="/LastOS/LinuxGames/*"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #notify-send --hint=int:transient:1  "Please wait, Installing Linux Game:" "$f"
  #wine "$f"
  llapp -install "$f"
done

FILES="/LastOS/WindowsGames/*"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #notify-send --hint=int:transient:1  "Please wait, Installing Windows Game:" "$f"
  #wine "$f"
  llapp -install "$f"
done

#Install Fonts needed for games etc
wine "/LastOS/Scripts-Wine/Fonts.exe"

#Apply Reg Tweaks
wine regedit /s "/LastOS/Scripts-Wine/LastOS-Tweaks.reg"

#trash-empty
gio trash --empty

#Run Updates off USB/ISO and Copy Update Overlays
notify-send --hint=int:transient:1  "Installing any Updates off the Installation Disk"
for d in /media/*/ ; do
for g in $d*/ ; do
if [ -f "$g"LastOS_Update/LastOS_Update.sh ] ; then
echo ""$g"LastOS_Update/LastOS_Update.sh"
bash "$g"LastOS_Update/LastOS_Update.sh
fi
done
done

if [ -f "/LastOS/Scripts/AddLastOSFileTypes.sh" ] ; then
bash "/LastOS/Scripts/AddLastOSFileTypes.sh"
fi

#No longer required, you just have to reboot the VM, re-run Calamares Prep and then capture the ISO and Updates/APT work as expectd.
#mintupdate &
#sleep 5
#xdotool windowactivate $(xdotool search "Update Manager") && xdotool key ctrl+r
#
#xdotool windowminimize $(xdotool search "Update Manager")

##Close all notifications (Fails)
#killall notify-osd
killall zenity


#notify-send --hint=int:transient:1  "Finnished Installing" "Enjoy using LastOSLinux"
notify-send "Finnished Installing,  Enjoy using LastOSLinux"
zenity --timeout 10 --info --text "   Finnished Installing\nEnjoy using LastOSLinux" &
