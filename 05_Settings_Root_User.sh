#!/bin/bash

#Set No effects (Feels faster)
sudo gsettings set org.cinnamon desktop-effects false

#Transparent Panels
sudo dconf write /org/cinnamon/enabled-extensions "['transparent-panels@germanfr']"

#Set Clock to 12H not 24H
sudo gsettings set org.cinnamon.desktop.interface clock-use-24h false

#Set Wallpaper
sudo gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/lastos/Wallpaper.jpg'

#Set Login Background
sudo gsettings set x.dm.slick-greeter background '/usr/share/backgrounds/lastos/Login.jpg'

#Desktop Icon Grid Size and disable sorting by default
sudo gsettings set org.nemo.desktop use-desktop-grid false
sudo gsettings set org.nemo.desktop horizontal-grid-adjust 0.4
sudo gsettings set org.nemo.desktop vertical-grid-adjust 0.4

#Really disable Auto-Arrange
# change the setting in the metadata file
sudo sed -i 's/view-auto-layout=true/view-auto-layout=false/g' "$HOME/.config/nemo/desktop-metadata"

#Desktop Icons
sudo gsettings set org.nemo.desktop computer-icon-visible true
sudo gsettings set org.nemo.desktop trash-icon-visible true
#Show USB and DVD on desktop - Set to false so I can't see them.
sudo gsettings set org.nemo.desktop volumes-visible false


#hotkeys to system monitor
# system monitor keybinding for (ctrl + shift + escape) and (ctrl + alt + delete)
sudo dconf write /org/cinnamon/desktop/keybindings/custom-list "['custom0']"
sudo dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/command "'gnome-system-monitor'"
sudo dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/name "'System Monitor'"
sudo dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/binding "['<Primary><Shift>Escape', '<Primary><Alt>Delete']"
sudo dconf write /org/cinnamon/desktop/keybindings/media-keys/logout "['<Primary><Alt>o']"

#Make Mouse window move Modifier Super Key instead of ALT so Photoshop works with alt key to set Source
sudo dconf write /org/gnome/desktop/wm/preferences/mouse-button-modifier "'<Super>'"
sudo dconf write /org/cinnamon/desktop/wm/preferences/mouse-button-modifier "'<Super>'"
sudo gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
sudo gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier '<Super>'

#Acount picture
sudo cp /usr/share/icons/LastOS.png $HOME/.face

#Disable Lock when Screensaver
sudo gsettings set org.cinnamon.desktop.screensaver lock-enabled false

##Enable Trackpad Gestures
sudo gsettings set org.cinnamon.gestures enabled true

#Show icons in Menus
sudo dconf write /org/cinnamon/settings-daemon/plugins/xsettings/menus-have-icons "true"

#Set Fonts
sudo gsettings set org.cinnamon.desktop.interface font-name 'Ubuntu 9'
sudo gsettings set org.gnome.desktop.interface font-name 'Ubuntu 9'
sudo gsettings set org.nemo.desktop font 'Ubuntu 9'
sudo gsettings set org.gnome.desktop.interface document-font-name 'Sans 9'
sudo gsettings set org.gnome.desktop.interface monospace-font-name 'DejaVu Sans Mono 9'
sudo gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Ubuntu Medium 9'

#Set Dark Theme
sudo gsettings set org.cinnamon.desktop.interface gtk-theme "LastOS"
sudo gsettings set org.cinnamon.desktop.interface icon-theme "Windows-10-master"
sudo gsettings set org.cinnamon.theme name "LastOS"
sudo gsettings set org.gnome.desktop.interface gtk-theme "LastOS"

#Set White Mouse Cursor
sudo gsettings set org.cinnamon.desktop.interface cursor-theme "DMZ-White"
sudo gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"
sudo gsettings set x.dm.slick-greeter cursor-theme-name "DMZ-White"
#Set Default WINE Mouse Cursor to DMZ-White
sudo update-alternatives --set x-cursor-theme /usr/share/icons/DMZ-White/cursor.theme

#Configure Xed to be better
sudo gsettings set org.x.editor.preferences.editor display-line-numbers true
sudo gsettings set org.x.editor.preferences.editor bracket-matching false
#gsettings set org.x.editor.preferences.editor scheme 'classic' (Classic Theme has White Line Number bar, looks bad)
sudo gsettings set org.x.editor.plugins active-plugins "['filebrowser', 'modelines', 'open-uri-context-menu', 'docinfo', 'textsize', 'sort', 'joinlines', 'spell', 'time']"

#Configure Nemo to have better Windowsy defaults
sudo gsettings set org.nemo.preferences quick-renames-with-pause-in-between true
sudo gsettings set org.nemo.preferences default-folder-viewer 'compact-view'
#sudo gsettings set org.nemo.preferences inherit-folder-viewer true #Not Needed when default view is set
sudo gsettings set org.nemo.preferences show-full-path-titles true

sudo gsettings set org.nemo.preferences show-new-folder-icon-toolbar true
sudo gsettings set org.nemo.preferences show-open-in-terminal-toolbar true
sudo gsettings set org.nemo.preferences show-computer-icon-toolbar true

sudo gsettings set org.cinnamon.sounds login-enabled false
sudo gsettings set org.cinnamon.sounds logout-enabled false

#Show hover tooltips on files/folders (Not everyone will want this, I should make a Settings choices app)
sudo gsettings set org.nemo.preferences tooltips-show-file-type true
sudo gsettings set org.nemo.preferences tooltips-show-path true
sudo gsettings set org.nemo.preferences tooltips-in-icon-view true
sudo gsettings set org.nemo.preferences tooltips-on-desktop true

#Close Network on Nemo Sidebar (Opened by default)
sudo gsettings set org.nemo.window-state network-expanded false

#Fractional Scaling Enabled (Breaks VirtualBox, which is why they don't enable it by default)
#gsettings set org.cinnamon.muffin experimental-features "['scale-monitor-framebuffer', 'x11-randr-fractional-scaling']"

#Change Main Menu icon to LastOS
sudo cd $HOME/.config/cinnamon/spices/menu@cinnamon.org/
sudo grep -lZ '"value": "linuxmint-logo-ring-symbolic"' 0.json | xargs -0 sed -i 's|"value": "linuxmint-logo-ring-symbolic"|"value": "/usr/share/icons/Start Button.png"|g'


#Add LastOS File Types for LLApp/Game files
sudo ./Tools/AddLastOSFileTypes.sh

#####################################################################################################################################

#Hide Hidden Files By Default
sudo gsettings set org.nemo.preferences show-hidden-files false


sudo numlockx on

# exit
