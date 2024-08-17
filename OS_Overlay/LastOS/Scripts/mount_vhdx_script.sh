#!/bin/bash

VHDX_IMG=$1

MOUNT_POINT="$HOME/mnt/lastosVHDimage"

#I do not know why this is needed, but it can't work with %1 weirdly
echo $VHDX_IMG > $HOME/mnt/mntfile
VHDX_IMG=$(cat "$HOME/mnt/mntfile")
rm -f "$HOME/mnt/mntfile"

mkdir -p "$MOUNT_POINT"

# [ubuntu] How do you mount a VHD image
# https://ubuntuforums.org/showthread.php?t=2299701
# 

sudo modprobe nbd

# Load the nbd kernel module.
sudo rmmod nbd;sudo modprobe nbd max_part=16

# mount block device
sudo qemu-nbd -c /dev/nbd0 "$VHDX_IMG"

# reload partition table
sudo partprobe /dev/nbd0

# mount partition
sudo mount -o rw,nouser /dev/nbd0p1 "$MOUNT_POINT"

clear
echo
echo ~~~ Do NOT close this terminal ~~~
echo
echo Close the "$MOUNT_POINT" window to unmount VHD when done
echo

sudo nemo "$MOUNT_POINT" 2>/dev/null

#Waits until you close Nemo then unmounts

sudo umount "$MOUNT_POINT" && sudo qemu-nbd -d /dev/nbd0 && sudo rmmod nbd




