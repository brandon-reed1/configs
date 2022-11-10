#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on debian
##  make a usb sudo dd bs=4M if=Downloads/debian.iso of=/dev/sd<?> conv=fdatasync status=progress 

## Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

echo "${GREEN}nonfree repositories and updating${NONE}"
sudo apt-add-repository non-free
sudo apt-add-repository contrib
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get update -y && sudo apt-get upgrade

echo "${GREEN}git config${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir gh

echo "${GREEN}Huion tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN}install flatpak nodejs, tree, ffmpeg, build-essential, shellcheck, bluetooth drivers${NONE}"
sudo apt-get install -y flatpak gnome-software-plugin-flatpak nodejs tree ffmpeg build-essential shellcheck pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${GREEN}Flatpak install Blender, Discord, Boxes, Inkscape, Krita, postman, Godot, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub org.blender.Blender \
com.discordapp.Discord org.gnome.Boxes md.obsidian.Obsidian \
com.getpostman.Postman org.kde.krita org.godotengine.GFodot \
org.inkscape.Inkscape com.atlauncher.ATLauncher com.obsproject.Studio \

echo "${GREEN}golang ${NONE}"

echo "${GREEN}aws-cli ${NONE}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install 

echo "${GREEN}gcp-cli ${NONE}"
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-408.0.1-linux-x86_64.tar.gz
tar -xf google-cloud-cli-408.0.1-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

echo "${GREEN}nvidia drivers${NONE}"
sudo apt autoremove $(dpkg -l nvidia-driver* |grep ii |awk '{print $2}')
curl -O https://us.download.nvidia.com/XFree86/Linux-x86_64/515.76/NVIDIA-Linux-x86_64-515.76.run
chmod +x NVIDIA-Linux-x86_64-515.76.run
sudo apt install linux-headers-$(uname -r) gcc make acpid dkms libglvnd-core-dev libglvnd0 libglvnd-dev dracut
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
sudo init 3
./NVIDIA-Linux-x86_64-515.76.run
