#!/bin/bash

bash 01_Configure_LastOS_Mint.sh
bash 01_Copy_ToOverlay.sh
bash 02_Copy_Overlay.sh
bash 03_Get_Packages.sh
bash 04_Get_WINE.sh
bash 05_Settings_Main_User.sh
bash 05_Settings_Root_User.sh

bash 07_Clean_OS.sh
bash 08_Copy_Main_User_To_Skel.sh
bash 09_Prepare_Penguins_Eggs.sh
