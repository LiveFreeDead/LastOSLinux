#!/bin/bash

mkdir -p ./OS_Overlay/etc/skel/.local/share/nemo/scripts
cp -rf $HOME/.local/share/nemo/scripts/* ./OS_Overlay/etc/skel/.local/share/nemo/scripts

#Copy grouped window to main user first, so it keeps chrome and Cycle windows
mkdir -p $HOME/.config/cinnamon/spices/grouped-window-list@cinnamon.org/
cp -f ./OS_Overlay/etc/skel/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json $HOME/.config/cinnamon/spices/grouped-window-list@cinnamon.org/

mkdir -p $HOME/.config/cinnamon/spices/calendar@cinnamon.org/
cp -f ./OS_Overlay/etc/skel/.config/cinnamon/spices/calendar@cinnamon.org/13.json $HOME/.config/cinnamon/spices/calendar@cinnamon.org/



mkdir -p ./OS_Overlay/etc/skel/.config/cinnamon/spices
cp -rf $HOME/.config/cinnamon/spices/* ./OS_Overlay/etc/skel/.config/cinnamon/spices

mkdir -p ./OS_Overlay/etc/skel/.local/share/cinnamon/desklets
cp -rf $HOME/.local/share/cinnamon/desklets/* ./OS_Overlay/etc/skel/.local/share/cinnamon/desklets

mkdir -p ./OS_Overlay/etc/skel/.local/share/cinnamon/extensions
cp -rf $HOME/.local/share/cinnamon/extensions/* ./OS_Overlay/etc/skel/.local/share/cinnamon/extensions
