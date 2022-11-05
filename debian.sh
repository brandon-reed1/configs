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
sudo apt-get update -y && sudo apt-get upgrade

echo "${GREEN} Install nvidia driver${NONE}"
sudo apt install nvidia-detect
sudo apt install nvidia-driver

echo "${GREEN} Snap install GO, aws-cli, google-cloud-cli, nvim${NONE}"
sudo apt install snapd
systemctl status snapd
sudo snap install core
sudo snap install go --classic 
sudo snap install aws-cli --classic 
sudo snap install google-cloud-cli --classic 

echo "${GREEN} Downloading github projects to /github dir${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir Desktop/gh

echo "${GREEN} Install Huion graphics tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN} apt install nodejs, ffmpeg, build-essential shellcheck${NONE}"
sudo apt-get install -y flatpak nodejs ffmpeg build-essential shellcheck pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${GREEN} Flatpak install kdenlive, Blender, LibreOffice, Discord, Boxes, Inkscape, Krita, postman, Godot, Audacity, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord org.gnome.Boxes md.obsidian.Obsidian \
com.getpostman.Postman org.kde.krita org.godotengine.GFodot org.inkscape.Inkscape org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio
       
init 6
