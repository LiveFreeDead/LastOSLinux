#!/bin/bash

#Make ISO and open folder to it
echo Make SquashFS...
sudo Tools/Egg3-mksquishfs.sh

sudo Tools/Egg4-UnBind.sh

echo Make ISO...
sudo Tools/Egg5-Make_ISO.sh

#Opens the ISO folder as root (owned by root) the & should allow the script to exit and leave Nemo running.
sudo Tools/Egg2-Open_Mount_as_Root.sh
