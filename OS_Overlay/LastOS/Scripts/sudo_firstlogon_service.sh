#!/usr/bin/env /bin/bash

#echo "Service Ran" > /LastOS/ServiceRan.txt

#Exit Script if it's set to disabled, so that nobody uses it for evil
if [ -f /LastOS/Scripts/sudo_firstlogon_service.sh.disabled ] ; then
exit
fi

######################### EXIT LIVE USER ##############################
#Not needed as the filesystem is cloned from the squishfs and not from Live :)
#Exit if live user
#if [ "$(whoami)" == "live" ]; then
#    exit
#fi

#Make symbolic link to llapp
ln -s /LastOS/LastOSLinux_Store/Tools/LLApp/LLApp.gambas /usr/bin/llapp

#Fix mintupdate (Update Manager)
apt-get update

#Run Sudo LastOS Updates
#Run Sudo Updates off USB/ISO and Copy Update Overlays
for d in /media/*/ ; do
for g in $d*/ ; do
if [ -f "$g"LastOS_Update/Sudo_LastOS_Update.sh ] ; then
echo ""$g"LastOS_Update/Sudo_LastOS_Update.sh"
bash "$g"LastOS_Update/Sudo_LastOS_Update.sh
fi
done
done

if [ -f /LastOS_Update/Sudo_LastOS_Update.sh ] ; then
bash /LastOS_Update/Sudo_LastOS_Update.sh
fi

#Disable Service script
cp /LastOS/Scripts/sudo_firstlogon_service.sh /LastOS/Scripts/sudo_firstlogon_service.sh.disabled
#Lock it down
chown root:root /LastOS/Scripts/sudo_firstlogon_service.sh
chmod 755 /LastOS/Scripts/sudo_firstlogon_service.sh
chown root:root /LastOS/Scripts/sudo_firstlogon_service.sh.disabled
chmod 755 /LastOS/Scripts/sudo_firstlogon_service.sh.disabled
chown root:root /LastOS/Scripts
chmod 755 /LastOS/Scripts

