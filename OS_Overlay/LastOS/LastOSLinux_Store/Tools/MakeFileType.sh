#!/bin/bash

#set -e # stop on error

argv=("$@")

APP=${argv[0]}
EXT=${argv[1]}
COMMENT=${argv[2]}
EXEC=${argv[3]}
LOGO=${argv[4]}


#APP=llapp
#EXT=lla
#COMMENT="LLApp File"
#EXEC=/usr/bin/llapp
#LOGO=/LastOS/LLOSStore.png

xdg-icon-resource install --context mimetypes --size 48 $LOGO application-x-$APP

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
    <mime-type type=\"application/x-$APP\">
        <comment>$COMMENT</comment>
        <icon name=\"application-x-$APP\"/>
        <glob pattern=\"*.$EXT\"/>
    </mime-type>
</mime-info>" > $APP-mime.xml

xdg-mime install $APP-mime.xml
rm $APP-mime.xml
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
"> $APP.desktop
desktop-file-install --dir=$HOME/.local/share/applications $APP.desktop
rm $APP.desktop
update-desktop-database $HOME/.local/share/applications

xdg-mime default $APP.desktop application/x-$APP

update-icon-caches $HOME/.local/share/icons/*
