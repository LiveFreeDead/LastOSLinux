#On my nVidia GFX, it sometimes fails to wake the PC, then I have to press Windows + P or Ctrl + Alt + F7 many times to get it to come back, the script below seems to fix the wake issues for me.

sudo rm /etc/systemd/system/systemd-hibernate.service.requires/nvidia-resume.service
sudo rm /etc/systemd/system/systemd-hibernate.service.requires/nvidia-hibernate.service
sudo rm /etc/systemd/system/systemd-suspend.service.requires/nvidia-resume.service
sudo rm /etc/systemd/system/systemd-suspend.service.requires/nvidia-suspend.service

sudo systemctl daemon-reload
systemctl daemon-reload

#https://gist.github.com/bmcbm/375f14eaa17f88756b4bdbbebbcfd029
