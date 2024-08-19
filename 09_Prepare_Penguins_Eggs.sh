#!/bin/bash

#Remove Old Kernels, can use the update manager, pick view, kernels and remove them manually too.
sudo ./Tools/remove-old-kernels.sh exec

##Below isn't needed as I do it at the 01 Script and the Kernel should be updated by then.
#sudo update-alternatives --config default.plymouth
#sudo update-initramfs -u -k all

##Very First thing is make the error level in grub less (defaults to 4 in Ubuntu/Mint, I'll set it to 2, 3 is recommended (so may need to change it) (2 Critical)(3 Error)(4 Warnings))
#sudo grep -lZ 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"' /etc/default/grub| sudo xargs -0 sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"|GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=2 splash"|g'
#sudo update-grub

#Copy exclude list
sudo cp -f OS_Overlay/etc/penguins-eggs.d/exclude.list /etc/penguins-eggs.d/
sudo chmod 775 "/etc/penguins-eggs.d/exclude.list"

#This line is required to copy calamares-modules across, will fail to install without it
sudo eggs calamares

#Set Penguins Eggs to be loaded from a file instead of done manually.
sudo eggs dad -d --file ./LastOSeggs.yaml

#Copy exclude list again, just in case it gets removed again
sudo cp -f OS_Overlay/etc/penguins-eggs.d/exclude.list /etc/penguins-eggs.d/
sudo chmod 775 "/etc/penguins-eggs.d/exclude.list"

#Below only copies the .config folder, not useful for building a LastOS skel folder, do manually with my own script
#sudo eggs tools skel -u $(whoami)

