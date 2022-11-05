#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on debian
##  make a usb sudo dd bs=4M if=Downloads/debian.iso of=/dev/sd<?> conv=fdatasync status=progress 
##

## Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

echo "${GREEN} Adding nonfree repositories and updating${NONE}"
sudo apt-add-repository non-free
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get update -y && sudo apt-get upgrade

echo "${GREEN} Install nvidia driver${NONE}"
sudo apt install nvidia-detect
sudo apt install nvidia-driver

sudo snap install google-cloud-cli --classic 

echo "${GREEN} Downloading github projects to /github dir${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir Desktop/gh

echo "${GREEN} Install Huion graphics tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN} apt install nodejs, ffmpeg, build-essential shellcheck${NONE}"
sudo apt-get install -y flatpak nodejs ffmpeg build-essential shellcheck pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware nvidia-cuda-toolkit nvidia-cuda-dev
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${GREEN} Flatpak install kdenlive, Blender, LibreOffice, Discord, Boxes, Inkscape, Krita, postman, Godot, Audacity, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord org.gnome.Boxes md.obsidian.Obsidian \
com.getpostman.Postman org.kde.krita org.godotengine.GFodot org.inkscape.Inkscape org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio

echo "${GREEN} golang ${NONE}"
sudo curl -L https://go.dev/dl/go1.19.3.linux-amd64.tar.gz -o /usr/local/go19.tar.gz
sudo tar -zxvf /usr/local/go19.tar.gz
echo "export PATH=/usr/local/go/bin:${PATH}" | sudo tee /etc/profile.d/go.sh
source /etc/profile.d/go.sh
echo "export PATH=/usr/local/go/bin:${PATH}" | sudo tee -a $HOME/.profile
source $HOME/.profile 
 
echo "${GREEN} aws-cli ${NONE}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install 

echo "${GREEN} gcp-cli ${NONE}"
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-408.0.1-linux-x86_64.tar.gz
tar -xf google-cloud-cli-408.0.1-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

sudo reboot
