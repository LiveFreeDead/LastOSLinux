#!/bin/bash

#Fix /LastOS Ownership (775 might be enough, but I'll go 777 as I want all users to access this folder)
#Chown Sets it to User ID 1000 (All Users)
sudo chmod -R 777 "/LastOS"
sudo chown -f -Rc $USER:$USER "/LastOS"
sudo chown -f -R :users "/LastOS"

#Make the sudo service executable and not editable by users
sudo chmod 755 "/LastOS/Scripts/sudo_firstlogon_service.sh"
#sudo chmod 775 "/LastOS/Scripts/sudo_firstlogon_service.sh"
#sudo chown root:root "/LastOS/Scripts/sudo_firstlogon_service.sh"
sudo chmod +x "/LastOS/Scripts/sudo_firstlogon_service.sh"

#Copy shortcuts to menu (Just in case)
sudo cp -a /LastOS/*.desktop $HOME/.local/share/applications
sudo cp -a /LastOS/Tools/*.desktop $HOME/.local/share/applications
