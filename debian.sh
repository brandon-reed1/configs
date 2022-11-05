#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on debian
##  make a usb sudo dd bs=4M if=Downloads/debian.iso of=/dev/sd<?> conv=fdatasync status=progress 
##

## Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

echo "${GREEN}nonfree repositories and updating${NONE}"
sudo apt install wget
sudo apt-add-repository non-free
sudo apt-add-repository contrib
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-debian11-11-8-local_11.8.0-520.61.05-1_amd64.deb && sudo dpkg -i cuda-repo-debian11-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-debian11-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update -y && sudo -y apt-get upgrade


echo "${GREEN}git config${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir Desktop/gh

echo "${GREEN}nvidia drivers${NONE}"
sudo apt install -y nvidia-detect
sudo apt install -y nvidia-driver
sudo apt-get -y install cuda

echo "${GREEN}Huion tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN}install nodejs, ffmpeg, build-essential shellcheck${NONE}"
sudo apt-get install -y flatpak nodejs ffmpeg build-essential shellcheck pulseaudio google-cloud-cli /
pulseaudio-module-bluetooth pavucontrol bluez-firmware apt-transport-https ca-certificates gnupg
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${GREEN}Flatpak install Blender, Discord, Boxes, Inkscape, Krita, postman, Godot, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub org.blender.Blender \
com.discordapp.Discord org.gnome.Boxes md.obsidian.Obsidian \
com.getpostman.Postman org.kde.krita org.godotengine.GFodot \
org.inkscape.Inkscape com.atlauncher.ATLauncher com.obsproject.Studio \

echo "${GREEN}golang ${NONE}"
wget https://golang.org/dl/go1.19.3.linux-amd64.tar.gz
sudo tar -zxvf go1.19.3.linux-amd64.tar.gz -C /usr/local/
echo "export PATH=/usr/local/go/bin:${PATH}" | sudo tee /etc/profile.d/go.sh
source /etc/profile.d/go.sh
echo "export PATH=/usr/local/go/bin:${PATH}" | sudo tee -a $HOME/.profile source
source $HOME/.profile

echo "${GREEN}aws-cli ${NONE}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install 
