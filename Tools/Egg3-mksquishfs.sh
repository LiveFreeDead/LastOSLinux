#Fix apt Cache before capture
#Added sleep to give the system time to update before running the apt update
echo Sleeping 3 seconds so Apt can renew...
sleep 3
#Disabled below to see if Apt is fixed
#sudo apt update -y

cd /home/eggs/ovarium
sudo ./mksquashfs

