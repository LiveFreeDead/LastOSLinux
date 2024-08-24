#!/bin/bash

mkdir -p ./OS_Overlay/etc/skel/.local/share/nemo/scripts
cp -rf $HOME/.local/share/nemo/scripts/* ./OS_Overlay/etc/skel/.local/share/nemo/scripts

mkdir -p ./OS_Overlay/etc/skel/.config/cinnamon/spices
cp -rf $HOME/.config/cinnamon/spices/* ./OS_Overlay/etc/skel/.config/cinnamon/spices

mkdir -p ./OS_Overlay/etc/skel/.local/share/cinnamon/desklets
cp -rf $HOME/.local/share/cinnamon/desklets/* ./OS_Overlay/etc/skel/.local/share/cinnamon/desklets

mkdir -p ./OS_Overlay/etc/skel/.local/share/cinnamon/extensions
cp -rf $HOME/.local/share/cinnamon/extensions/* ./OS_Overlay/etc/skel/.local/share/cinnamon/extensions
