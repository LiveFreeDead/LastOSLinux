#!/bin/bash

VHDX_IMG=$1

MOUNT_POINT="$HOME/mnt/lastosVHDimage2"

#I do not know why this is needed, but it can't work with %1 weirdly
echo $VHDX_IMG > $HOME/mnt/mntfile
VHDX_IMG=$(cat "$HOME/mnt/mntfile")
rm -f "$HOME/mnt/mntfile"

mkdir -p "$MOUNT_POINT"

# [ubuntu] How do you mount a VHD image
# https://ubuntuforums.org/showthread.php?t=2299701
# 

ID=$(id -u)
UD=$(id -g)

# mount partition
sudo guestmount --add "$VHDX_IMG" --rw -o uid=$ID -o gid=$UD -o allow_other --pid-file guestmount.pid "$MOUNT_POINT" -m /dev/sda1

#clear
echo
echo ~~~ Do NOT close this terminal ~~~
echo
echo Close the "$MOUNT_POINT" window to unmount VHD when done
echo

sudo nemo "$MOUNT_POINT" 2> /dev/null

sleep 1
echo "Unmounting..."
pid="$(cat guestmount.pid)"
sudo guestunmount  "$MOUNT_POINT"

timeout=10
 
 count=$timeout
 while kill -0 "$pid" 2>/dev/null && [ $count -gt 0 ]; do
     sleep 1
     ((count--))
 done
 if [ $count -eq 0 ]; then
     echo "$0: wait for guestmount to exit failed after $timeout seconds"
     exit 1
 fi

sudo rm -f guestmount.pid
 
 # Now it is safe to use the disk image.
