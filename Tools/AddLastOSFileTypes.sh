#!/bin/bash
#set -e # stop on error

eval ICONTHEME=$(gsettings get org.gnome.desktop.interface icon-theme)
APP=llapp
EXT=lla
COMMENT="LLApp File"
EXEC=/usr/bin/llapp
LOGO=/LastOS/LLOSStore.png

xdg-icon-resource install --context mimetypes --size 256 $LOGO application-x-$APP

xdg-icon-resource install --context mimetypes --size 256 --theme $ICONTHEME $LOGO application-x-$APP

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
    <mime-type type=\"application/x-$APP\">
        <comment>$COMMENT</comment>
        <icon name=\"application-x-$APP\"/>
        <glob pattern=\"*.lla\"/>
        <glob pattern=\"*.LLApp.tar\"/>
        <glob pattern=\"ppApp.app\"/>
        <glob pattern=\"*ppApp.apz\"/>
    </mime-type>
</mime-info>" > /tmp/$APP-mime.xml

xdg-mime install /tmp/$APP-mime.xml
rm /tmp/$APP-mime.xml
update-mime-database $HOME/.local/share/mime

echo "[Desktop Entry]
Name=$APP
Exec=$EXEC %U
MimeType=application/x-$APP
Icon=application-x-$APP
Terminal=false
NoDisplay=true
Type=Application
Categories=
Comment=$COMMENT
"> /tmp/$APP.desktop
desktop-file-install --dir=$HOME/.local/share/applications /tmp/$APP.desktop
rm /tmp/$APP.desktop
update-desktop-database $HOME/.local/share/applications

xdg-mime default $APP.desktop application/x-$APP

chmod +x $HOME/.local/share/applications/$APP.desktop


APP=llgame
EXT=llg
COMMENT="LLGame File"
EXEC=/usr/bin/llapp
LOGO=/LastOS/LLOSStore.png

xdg-icon-resource install --context mimetypes --size 256 $LOGO application-x-$APP

xdg-icon-resource install --context mimetypes --size 256 --theme $ICONTHEME $LOGO application-x-$APP

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
    <mime-type type=\"application/x-$APP\">
        <comment>$COMMENT</comment>
        <icon name=\"application-x-$APP\"/>
        <glob pattern=\"*.llg\"/>
        <glob pattern=\"*.LLGame.tar\"/>
        <glob pattern=\"*.ppg\"/>
        <glob pattern=\"*.pgz\"/>
    </mime-type>
</mime-info>" > /tmp/$APP-mime.xml

xdg-mime install /tmp/$APP-mime.xml
rm /tmp/$APP-mime.xml
update-mime-database $HOME/.local/share/mime

echo "[Desktop Entry]
Name=$APP
Exec=$EXEC %U
MimeType=application/x-$APP
Icon=application-x-$APP
Terminal=false
NoDisplay=true
Type=Application
Categories=
Comment=$COMMENT
"> /tmp/$APP.desktop
desktop-file-install --dir=$HOME/.local/share/applications /tmp/$APP.desktop
rm /tmp/$APP.desktop
update-desktop-database $HOME/.local/share/applications

xdg-mime default $APP.desktop application/x-$APP

chmod +x $HOME/.local/share/applications/$APP.desktop

update-icon-caches $HOME/.local/share/icons/*

xdg-mime default wine.desktop application/x-ms-dos-executable
xdg-mime default wine.desktop application/x-msi
xdg-mime default wine.desktop application/x-ms-shortcut
xdg-mime default wine.desktop application/x-bat
xdg-mime default wine.desktop application/x-mswinurl

xdg-mime default xed.desktop text/plain

xdg-mime default wine-extension-apz.desktop application/x-wine-extension-apz
xdg-mime default wine-extension-pgz.desktop application/x-wine-extension-pgz

#xdg-mime default llapp.desktop application/x-xz-compressed-tar



