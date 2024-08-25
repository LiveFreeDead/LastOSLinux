#!/bin/bash

#Set No effects (Feels faster)
gsettings set org.cinnamon desktop-effects false

#Transparent Panels
dconf write /org/cinnamon/enabled-extensions "['transparent-panels@germanfr']"

#Set Clock to 12H not 24H
gsettings set org.cinnamon.desktop.interface clock-use-24h false

#Set Wallpaper
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/lastos/Wallpaper.jpg'

#Set Login Background
gsettings set x.dm.slick-greeter background '/usr/share/backgrounds/lastos/Login.jpg'

#Desktop Icon Grid Size and disable sorting by default
gsettings set org.nemo.desktop use-desktop-grid false
gsettings set org.nemo.desktop horizontal-grid-adjust 0.4
gsettings set org.nemo.desktop vertical-grid-adjust 0.4

#Really disable Auto-Arrange
# change the setting in the metadata file
sed -i 's/view-auto-layout=true/view-auto-layout=false/g' "$HOME/.config/nemo/desktop-metadata"

#Desktop Icons
gsettings set org.nemo.desktop computer-icon-visible true
gsettings set org.nemo.desktop trash-icon-visible true
#Show USB and DVD on desktop - Set to false so I can't see them.
gsettings set org.nemo.desktop volumes-visible false


#hotkeys to system monitor
# system monitor keybinding for (ctrl + shift + escape) and (ctrl + alt + delete)
dconf write /org/cinnamon/desktop/keybindings/custom-list "['custom0']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/command "'gnome-system-monitor'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/name "'System Monitor'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/binding "['<Primary><Shift>Escape', '<Primary><Alt>Delete']"
dconf write /org/cinnamon/desktop/keybindings/media-keys/logout "['<Primary><Alt>o']"

#Make Mouse window move Modifier Super Key instead of ALT so Photoshop works with alt key to set Source
dconf write /org/gnome/desktop/wm/preferences/mouse-button-modifier "'<Super>'"
dconf write /org/cinnamon/desktop/wm/preferences/mouse-button-modifier "'<Super>'"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier '<Super>'

#Acount picture
cp /usr/share/icons/LastOS.png $HOME/.face

#Disable Lock when Screensaver
gsettings set org.cinnamon.desktop.screensaver lock-enabled false

##Enable Trackpad Gestures
gsettings set org.cinnamon.gestures enabled true

#Show icons in Menus
dconf write /org/cinnamon/settings-daemon/plugins/xsettings/menus-have-icons "true"

#Set Fonts
gsettings set org.cinnamon.desktop.interface font-name 'Ubuntu 9'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 9'
gsettings set org.nemo.desktop font 'Ubuntu 9'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 9'
gsettings set org.gnome.desktop.interface monospace-font-name 'DejaVu Sans Mono 9'
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Ubuntu Medium 9'

#Set Dark Theme
gsettings set org.cinnamon.desktop.interface gtk-theme "LastOS"
gsettings set org.cinnamon.desktop.interface icon-theme "Windows-10-master"
gsettings set org.cinnamon.theme name "LastOS"
gsettings set org.gnome.desktop.interface gtk-theme "LastOS"

#Set White Mouse Cursor
gsettings set org.cinnamon.desktop.interface cursor-theme "DMZ-White"
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"
gsettings set x.dm.slick-greeter cursor-theme-name "DMZ-White"
#Set Default WINE Mouse Cursor to DMZ-White
sudo update-alternatives --set x-cursor-theme /usr/share/icons/DMZ-White/cursor.theme

#Configure Xed to be better
gsettings set org.x.editor.preferences.editor display-line-numbers true
gsettings set org.x.editor.preferences.editor bracket-matching false
#gsettings set org.x.editor.preferences.editor scheme 'classic' (Classic Theme has White Line Number bar, looks bad)
gsettings set org.x.editor.plugins active-plugins "['filebrowser', 'modelines', 'open-uri-context-menu', 'docinfo', 'textsize', 'sort', 'joinlines', 'spell', 'time']"

#Configure Nemo to have better Windowsy defaults
gsettings set org.nemo.preferences quick-renames-with-pause-in-between true
gsettings set org.nemo.preferences default-folder-viewer 'compact-view'
#gsettings set org.nemo.preferences inherit-folder-viewer true #Not Needed when default view is set
gsettings set org.nemo.preferences show-full-path-titles true

gsettings set org.nemo.preferences show-new-folder-icon-toolbar true
gsettings set org.nemo.preferences show-open-in-terminal-toolbar true
gsettings set org.nemo.preferences show-computer-icon-toolbar true

gsettings set org.cinnamon.sounds login-enabled false
gsettings set org.cinnamon.sounds logout-enabled false
gsettings set org.cinnamon.sounds notification-enabled false

#Show hover tooltips on files/folders (Not everyone will want this, I should make a Settings choices app)
gsettings set org.nemo.preferences tooltips-show-file-type true
gsettings set org.nemo.preferences tooltips-show-path true
gsettings set org.nemo.preferences tooltips-in-icon-view true
gsettings set org.nemo.preferences tooltips-on-desktop true

#Close Network on Nemo Sidebar (Opened by default)
gsettings set org.nemo.window-state network-expanded false

#Fractional Scaling Enabled (Breaks VirtualBox, which is why they don't enable it by default)
#gsettings set org.cinnamon.muffin experimental-features "['scale-monitor-framebuffer', 'x11-randr-fractional-scaling']"

#Change Main Menu icon to LastOS
cd $HOME/.config/cinnamon/spices/menu@cinnamon.org/
grep -lZ '"value": "linuxmint-logo-ring-symbolic"' 0.json | xargs -0 sed -i 's|"value": "linuxmint-logo-ring-symbolic"|"value": "/usr/share/icons/Start Button.png"|g'


#Add LastOS File Types for LLApp/Game files
bash ./Tools/AddLastOSFileTypes.sh

#####################################################################################################################################

#Hide Hidden Files By Default
gsettings set org.nemo.preferences show-hidden-files false

#Restart Desktop (Let Icon Auto-Arrange be disable for this Session)
nemo-desktop --quit
nemo --no-default-window &

numlockx on

# exit

#######################################################################################################
########################### Everything below here is for reference ####################################
#######################################################################################################


##Change Main Menu icon (Debian)
#cd $HOME/.config/cinnamon/spices/menu@cinnamon.org/
#grep -lZ '"value": "cinnamon-symbolic"' 0.json | xargs -0 sed -i 's|"value": "cinnamon-symbolic"|"value": "/usr/share/icons/Start Button.png"|g'


###################################################################################





