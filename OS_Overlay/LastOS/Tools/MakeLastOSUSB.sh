#!/bin/bash

BASEDIR=/LastOS/Tools

xdg-open  $BASEDIR/HowToMakeUSB.txt

#notify-send --hint=int:transient:1 -u normal -t 10 "Pick your USB disk you want to format and make bootable with Ventoy"

x-terminal-emulator -e "sudo $BASEDIR/Ventoy/VentoyGUI.x86_64"

#notify-send --hint=int:transient:1 -u normal -t 10 "Copy the downloaded LastOSLinux_amd64_202x-xx-xx-xxxx.iso file (* Not contents) to the USB drive called ventoy (May need to safely remove and re-insert the USB disk for write access)"

#notify-send --hint=int:transient:1 -u normal -t 10 "Copy the USB_Overlay folder contents (* Not folder) to the USB drive called ventoy"

nemo "/LastOS/Tools/USB_Overlay" &
