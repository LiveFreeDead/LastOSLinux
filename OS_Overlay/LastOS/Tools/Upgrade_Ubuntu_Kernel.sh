#!/bin/bash

sudo apt-get -qq update
sudo apt-get -qq upgrade
sudo apt install -y wget

#Install Latest Kernel???? Good idea??? Can just update the v5 one
wget https://raw.githubusercontent.com/pimlie/ubuntu-mainline-kernel.sh/master/ubuntu-mainline-kernel.sh
sudo install ubuntu-mainline-kernel.sh /usr/local/bin/
sudo ubuntu-mainline-kernel.sh -c --yes
sudo ubuntu-mainline-kernel.sh -i --yes

sudo rm -f $HOME/ubuntu-mainline-kernel.sh
sudo rm -f $HOME/ubuntu-mainline-kernel.sh.1