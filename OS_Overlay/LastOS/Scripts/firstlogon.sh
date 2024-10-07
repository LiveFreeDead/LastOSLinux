#!/bin/bash

#Turn on NumLock by default for Live and the first time a user logs in
numlockx on

#Make sure Ctrl + Alt + Backspace restarts xserver
gsettings set org.gnome.libgnomekbd.keyboard options "['terminate\tterminate:ctrl_alt_bksp']"

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
    #Show Hidden Files By Default (Handy in LiveOS)
    gsettings set org.nemo.preferences show-hidden-files true
    killall conky
    mv -f $HOME/.config/conky/conky.conf $HOME/.config/conky/conky.conf.old
    mv -f $HOME/.config/conky/conky.conf.live $HOME/.config/conky/conky.conf
    conky
    exit
fi

######################### SETUP NEW USER ##############################

##notify-send --hint=int:transient:1 -u critical -t 0 "Please wait while LastOS Installs some things..."
#zenity --timeout 120 --info --text "Please wait while LastOS Installs some things..." &
#
######### Move Zenity ########
#while [ -N $(xdotool search --name "Information") ];do sleep .01 ;done 
#echo "Found: " $(xdotool search --name "Information") 2>/dev/null
#WinID=$(xdotool search --name "Information")
#xdotool windowmove --relative $WinID 0 -2000 2>/dev/null
#xdotool windowminimize $WinID 2>/dev/null
#sleep .01
#xdotool windowactivate $WinID 2>/dev/null
######### Move Zenity ########

#Trying to use yad instead, but it can't center to the top?
read x y < <(xrandr --current | grep -oP '\d+x\d+' | tr x ' ')
POSX2=$(($x/4))
POSX=$(($POSX2-200))
yad --image="dialog-information" \
  --no-escape \
  --timeout-indicator=bottom \
  --window-icon=dialog-information \
  --no-buttons \
  --on-top \
  --geometry=340x100+$POSX+0 \
  --timeout=240 \
  --title "LastOSLinux Installing" \
  --text "\n  Please wait while LastOS installs some things..." &

#Make sure login background is set
gsettings set x.dm.slick-greeter background '/usr/share/backgrounds/lastos/Login.jpg'


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

#Enable flathub repo's
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


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

#Run Settings
/LastOS/LastOSLinux_Settings/Settings &

#Install Vulkan to make Wine games run better - Just use steam, safer and contained
#bash /LastOS/Scripts-Wine/vulkan/setup-vulkan.sh

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


#install SetupS (Do this last as it has been known to stop installing and we don't want it to interfere with the other stuff
#notify-send --hint=int:transient:1  "Please wait, Installing Windows App:" "/LastOS/Scripts-Wine/01_SetupS.SendTo.Suite_v24.05.22.0_ssApp.exe"
notify-send --hint=int:transient:1  "Please wait, Installing Windows App:" "/LastOS/Scripts-Wine/Install.SetupS_v24.05.22.0.exe"

#wine /LastOS/Scripts-Wine/Install.SetupS_v24.05.22.0.exe /silent

#New Method with time out
rm -f "$HOME/.wine/drive_c/Program Files/SetupS.SendTo/Licenses/GNU.General.Public.License_GPLv3.txt"

wine /LastOS/Scripts-Wine/Install.SetupS_v24.05.22.0.exe /silent &

t=0
until [ -e "$HOME/.wine/drive_c/Program Files/SetupS.SendTo/Licenses/GNU.General.Public.License_GPLv3.txt" ] || (( t++ >= 16 )); do
  sleep 1
done
#echo "File Exists"
#wait a sec for it to finish
sleep 5

#echo "kill stuck setups"
killall ssControlPanel.exe
#Below shouldn't be needed but I'll leave for reference
#sleep 5
#killall Install.SetupS_v24.05.22.0.exe


FILES="/LastOS/WindowsApps/*"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #notify-send --hint=int:transient:1  "Please wait, Installing Windows App:" "$f"
  #wine "$f"
  llapp -install "$f"
done

#trash-empty
gio trash --empty

##Close all notifications (Fails)
#killall notify-osd
killall zenity
killall yad

##notify-send --hint=int:transient:1  "Finnished Installing" "Enjoy using LastOSLinux"
#notify-send "Finnished Installing,  Enjoy using LastOSLinux"
#zenity --timeout 10 --info --text "   Finnished Installing\nEnjoy using LastOSLinux" &
#
######### Move Zenity ########
#while [ -N $(xdotool search --name "Information") ];do sleep .01 ;done 
#echo "Found: " $(xdotool search --name "Information") 2>/dev/null
#WinID=$(xdotool search --name "Information")
#xdotool windowmove --relative $WinID 0 -2000 2>/dev/null
#xdotool windowminimize $WinID 2>/dev/null
#sleep .01
#xdotool windowactivate $WinID 2>/dev/null
######### Move Zenity ########

#sleep 5


#Trying to use yad instead
read x y < <(xrandr --current | grep -oP '\d+x\d+' | tr x ' ')
POSX2=$(($x/4))
POSX=$(($POSX2-200))
yad --image="dialog-information" \
  --no-escape \
  --timeout-indicator=bottom \
  --window-icon=dialog-information \
  --no-buttons \
  --on-top \
  --geometry=340x100+$POSX+0 \
  --timeout=10 \
  --title "LastOSLinux Installed" \
  --text "  Finnished Installing\n  Enjoy using LastOSLinux" &
