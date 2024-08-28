#!/bin/bash
declare -x DISPLAY=":0.0"
sleep 1
PATHS=$(wmctrl -lx | grep nemo.Nemo | sed -e "s#$hostname Home# - $HOME#" | awk -F' - /' '{print "/"$2}')
if [ "$PATHS" == "" ];
then
    echo "" > ~/.config/nemo/nemo.openwindows
else
    echo "$PATHS" > ~/.config/nemo/nemo.openwindows
fi
