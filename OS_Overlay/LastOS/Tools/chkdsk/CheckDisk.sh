#!/bin/bash

DISKS=""

readarray my_array < <(lsblk -o "FSTYPE","MOUNTPOINT","NAME")

for i in "${!my_array[@]}"
do
    NS=${my_array[$i]:0:4}
    if [ "$NS" == "ntfs" ]; then
        NEWS=$(echo "${my_array[$i]}" |cut -c 8-999)    
        
        #Only do items that are not mounted
        NS=${NEWS:0:4}
        if [ "$NS" == "    " ]; then
          DISKNEW=$(echo "$NEWS" | tr -dc '[:print:]' | xargs)
          DISKS+="$DISKNEW"\ 
        fi
    fi  

done

drive=$(zenity --height=300 --list --text "     UnMounted Partition to check:-     " --title "Check Disk NTFS" --column="Partitions able to be checked:-" $DISKS)

if [[ "$drive" == "" ]]; then
    echo "skipped"
else
    x-terminal-emulator -e "sudo ./chkufsd -fs:ntfs /dev/$drive -f"
    fix=$(zenity --info --title "Clear the Dirty Bit?" --text "Clear the Dirty Bit?" --ok-label No --extra-button Yes )
    if [ "$fix" == "Yes" ]; then
        x-terminal-emulator -e "sudo ntfsfix -d /dev/$drive"
    fi
fi


