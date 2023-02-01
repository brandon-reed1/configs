#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  Linux OS (Debian)
#  make a usb sudo dd bs=4M if=Downloads/debian.iso of=/dev/sd<?> conv=fdatasync status=progress
#
#  Applications
#  PXE Server, torrent, docker, cockpit, samba file share,
###################################################################

# Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

apt install curl -y

echo "${GREEN}adding nonfree repositories and updating${NONE}"
sudo apt-add-repository non-free
sudo apt-add-repository contrib
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get update -y && sudo apt-get upgrade -y

echo "${GREEN}Huion tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN}install flatpak nodejs, golang, tree, ffmpeg, build-essential, bluetooth drivers${NONE}"
sudo apt-get install -y flatpak nodejs ffmpeg pulseaudio pulseaudio-module-bluetooth bluez-firmware
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${GREEN}Flatpak install Blender, Discord, Boxes, Inkscape, Krita, postman, podman, Godot, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub io.podman_desktop.PodmanDesktop org.blender.Blender com.discordapp.Discord org.gnome.Boxes com.getpostman.Postman org.kde.krita org.godotengine.GFodot org.inkscape.Inkscape com.atlauncher.ATLauncher com.obsproject.Studio

echo "${GREEN}golang ${NONE}"

echo "${GREEN}aws-cli ${NONE}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install 

echo "${GREEN}gcp-cli ${NONE}"
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-408.0.1-linux-x86_64.tar.gz
tar -xf google-cloud-cli-408.0.1-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

echo "${GREEN} Install Radeon & Huion graphics tablet driver${NONE}"
    #Radeon™ Software for Linux® version 22.40 for Ubuntu 22.04.1
wget https://repo.radeon.com/amdgpu-install/22.40/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb
    sudo dpkg -i HuionTablet_v15.0.0.89.202205241352.x86_64.deb amdgpu-install_5.4.50401-1_all.deb
    amdgpu-install -y
