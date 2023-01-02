#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on Ubuntu 22.04.1
##  make a usb 
##  sudo dd bs=4M if=Downloads/ubuntu.iso of=/dev/sd<?> conv=fdatasync status=progress 

# Adds green to echos
    GREEN="$(tput setaf 2)"
    NONE="$(tput sgr0)"

    sudo apt update && sudo apt upgrade

echo "${GREEN} Install Radeon & Huion graphics tablet driver${NONE}"
    #Radeon™ Software for Linux® version 22.40 for Ubuntu 22.04.1
    wget https://repo.radeon.com/amdgpu-install/22.40/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb
    sudo dpkg -i HuionTablet_v15.0.0.89.202205241352.x86_64.deb amdgpu-install_5.4.50401-1_all.deb
    amdgpu-install -y

echo "${GREEN} No HIP blender fix${NONE}"
# https://askubuntu.com/questions/1434988/blender-3-3-does-not-recognize-my-gpu-for-hip-on-ubuntu-20-04
    sudo usermod -a -G video $USER 
    sudo usermod -a -G render $USER

echo "${GREEN} Snap install GO, Node, aws-cli, google-cloud-cli, blender, discord, krita, postman, obs, inkscape, VScode${NONE}"
    sudo snap set system experimental.parallel-instances=true
    sudo apt install git ffmpeg -y
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
    sudo snap install timeshift --classic

    init 6