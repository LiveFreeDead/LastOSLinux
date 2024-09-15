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

#Disabled below, need to play more and find better solution

##Desktop Icon Grid Size and disable sorting by default (The first line case to be true for Customie to show in the Context Menu)
####gsettings set org.nemo.desktop use-desktop-grid false
gsettings set org.nemo.desktop horizontal-grid-adjust 0.40000000000000002
gsettings set org.nemo.desktop vertical-grid-adjust 0.40000000000000002

##Really disable Auto-Arrange
## change the setting in the metadata file
#sed -i 's/view-auto-layout=true/view-auto-layout=false/g' "$HOME/.config/nemo/desktop-metadata"

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

#ctrl break to close all wine stuff, wineserver -k
dconf write /org/cinnamon/desktop/keybindings/custom-list "['custom0', 'custom1']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom1/command "'quitwine.sh'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom1/name "'Kill WINE'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom1/binding "['<Primary>Break']"

#Alt break to Fix display
dconf write /org/cinnamon/desktop/keybindings/custom-list "['custom0', 'custom1', 'custom2']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom2/command "'xrandr -s 0'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom2/name "'Fix Screen Res'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom2/binding "['<Alt>Break']"

#Make Mouse window move Modifier Super Key instead of ALT so Photoshop works with alt key to set Source
dconf write /org/gnome/desktop/wm/preferences/mouse-button-modifier "'<Super>'"
dconf write /org/cinnamon/desktop/wm/preferences/mouse-button-modifier "'<Super>'"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier '<Super>'

#Panel to Center (Instead of Menu etc being far left)
dconf write /org/cinnamon/enabled-applets "['panel1:center:0:menu@cinnamon.org:0', 'panel1:center:1:separator@cinnamon.org:1', 'panel1:center:2:grouped-window-list@cinnamon.org:2', 'panel1:right:0:systray@cinnamon.org:3', 'panel1:right:1:xapp-status@cinnamon.org:4', 'panel1:right:2:notifications@cinnamon.org:5', 'panel1:right:3:printers@cinnamon.org:6', 'panel1:right:4:removable-drives@cinnamon.org:7', 'panel1:right:5:keyboard@cinnamon.org:8', 'panel1:right:6:favorites@cinnamon.org:9', 'panel1:right:7:network@cinnamon.org:10', 'panel1:right:8:sound@cinnamon.org:11', 'panel1:right:9:power@cinnamon.org:12', 'panel1:right:10:calendar@cinnamon.org:13', 'panel1:right:11:cornerbar@cinnamon.org:14']"


#Acount picture (I use the /etc/skel folder now)
#cp /usr/share/icons/LastOS.png $HOME/.face

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
gsettings set org.cinnamon.desktop.interface gtk-theme "LastOS-Orchis-Dark-Compact"
gsettings set org.cinnamon.desktop.interface icon-theme "Windows-10-master"
gsettings set org.cinnamon.theme name "LastOS-Orchis-Dark-Compact"
gsettings set org.gnome.desktop.interface gtk-theme "LastOS-Orchis-Dark-Compact"

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

#Get thumbnails for images up to 30mb
gsettings set org.nemo.preferences thumbnail-limit 30485760

gsettings set org.nemo.preferences show-new-folder-icon-toolbar true
gsettings set org.nemo.preferences show-open-in-terminal-toolbar true
gsettings set org.nemo.preferences show-computer-icon-toolbar true

#Sound FX
gsettings set org.cinnamon.sounds login-enabled false
gsettings set org.cinnamon.sounds logout-enabled false
gsettings set org.cinnamon.sounds notification-enabled false
gsettings set org.cinnamon.desktop.sound volume-sound-enabled true
gsettings set org.cinnamon.desktop.sound volume-sound-file "/usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"


#Show hover tooltips on files/folders (Not everyone will want this, I should make a Settings choices app)
gsettings set org.nemo.preferences tooltips-show-file-type true
gsettings set org.nemo.preferences tooltips-show-path true
gsettings set org.nemo.preferences tooltips-in-icon-view true
gsettings set org.nemo.preferences tooltips-on-desktop true

#Close Network on Nemo Sidebar (Opened by default)
gsettings set org.nemo.window-state network-expanded false

#Fractional Scaling Enabled (Breaks VirtualBox, which is why they don't enable it by default)
#gsettings set org.cinnamon.muffin experimental-features "['scale-monitor-framebuffer', 'x11-randr-fractional-scaling']"

#Change default Time on lock screen to have date
#Lock Screen Formatting
gsettings set org.cinnamon.desktop.screensaver use-custom-format true
gsettings set org.cinnamon.desktop.screensaver time-format "%l:%M %p"
gsettings set org.cinnamon.desktop.screensaver date-format "            %A, %b %d"

#Disable Screen Lock and Resume With Lock
gsettings set org.cinnamon.settings-daemon.plugins.power lock-on-suspend false
gsettings set org.cinnamon.desktop.screensaver lock-enabled false
gsettings set org.cinnamon.desktop.screensaver lock-delay 0

#Screen Sleep after 15 Minutes
gsettings set org.cinnamon.desktop.session idle-delay 900


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





