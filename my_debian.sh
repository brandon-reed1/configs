#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  Linux OS (Debian)
#  make a usb sudo dd bs=4M if=Downloads/debian.iso of=/dev/sd<?> conv=fdatasync status=progress
#
#  Applications
#  
###################################################################
#update node


# Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

echo "${GREEN}adding nonfree repositories and updating${NONE}"
sudo apt-add-repository non-free
sudo apt-add-repository contrib
sudo apt-get update && sudo apt-get upgrade -y

echo "${GREEN}install flatpak nodejs, ffmpeg, build-essential, bluetooth drivers${NONE}"
sudo apt install -y flatpak ca-certificates curl gnupg lsb-release nodejs ffmpeg pulseaudio pulseaudio-module-bluetooth bluez-firmware openjdk-17-jdk openjdk-17-jre
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt-get update && sudo apt-get upgrade -y

echo "${GREEN}Flatpak install Blender, Discord, Boxes, Inkscape, Krita, postman, podman, Godot, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub io.podman_desktop.PodmanDesktop org.blender.Blender com.discordapp.Discord org.gnome.Boxes com.getpostman.Postman org.kde.krita org.godotengine.GFodot org.inkscape.Inkscape com.atlauncher.ATLauncher com.obsproject.Studio

echo "${GREEN}Docker ${NONE}"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "${GREEN}Huion tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

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
#wget https://repo.radeon.com/amdgpu-install/22.40/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb
    #sudo dpkg -i HuionTablet_v15.0.0.89.202205241352.x86_64.deb amdgpu-install_5.4.50401-1_all.deb
    #amdgpu-install -y
