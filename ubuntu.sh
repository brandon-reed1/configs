#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on Ubuntu 22.04.1
##  make a usb 
## sudo dd bs=4M if=Downloads/ubuntu.iso of=/dev/sd<?> conv=fdatasync status=progress 

## Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update && sudo apt upgrade

#Radeon™ Software for Linux® version 22.40 for Ubuntu 22.04.1
# https://askubuntu.com/questions/1434988/blender-3-3-does-not-recognize-my-gpu-for-hip-on-ubuntu-20-04
wget https://repo.radeon.com/amdgpu-install/22.40/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb
sudo apt install amdgpu-install_5.4.50401-1_all.deb -y && amdgpu-install -y
echo "username" read username
sudo usermod -a -G video $username 
sudo usermod -a -G render $username
      
echo "${GREEN} Snap install GO, Node, aws-cli, google-cloud-cli, nvim${NONE}"
sudo snap install go --classic 
sudo snap install node --classic
sudo snap install aws-cli --classic 
sudo snap install google-cloud-cli --classic 
sudo snap install blender --classic
sudo snap install discord --classic
sudo snap install krita --classic
sudo snap install postman --classic
sudo snap install obs-studio --classic
sudo snap install inkscape --classic
sudo snap install code --classic
sudo apt install git ffmpeg appimagelauncher -y

echo "${GREEN} Downloading github projects to /github dir${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
echo "[credential "https://github.com"]" >> .gitconfig
echo "input github token:"
read gittoken
sudo echo 'username = '$gittoken'' >> .gitconfig
sudo echo 'password = '$gittoken'' >> .gitconfig
mkdir gh

echo "${GREEN} Install Huion graphics tablet driver${NONE}"
wget https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb && sudo dpkg -i HuionTablet_v15.0.0.89.202205241352.x86_64.deb

init 6
