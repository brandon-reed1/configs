#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on Ubuntu
##  make a usb 
##  sudo dd bs=4M if=Downloads/ubuntu.iso of=/dev/sd<?> conv=fdatasync status=progress 

    sudo apt update && sudo apt upgrade -y 
   
echo "${GREEN} Snap install GO, Node, aws-cli, google-cloud-cli, blender, discord, krita, postman, obs, inkscape, VScode${NONE}"
    sudo apt install git ffmpeg mysql-client-core-8.0 openjdk-17-jdk openjdk-17-jre -y
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
    sudo snap install steam --edge
    sudo snap install kdenlive 
    sudo snap install terraform --classic
    sudo snap install remmina


#Downloads radeon GPU and huion tablet drivers
    wget https://repo.radeon.com/amdgpu-install/22.40/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb
    sudo dpkg -i HuionTablet_v15.0.0.89.202205241352.x86_64.deb amdgpu-install_5.4.50401-1_all.deb
    amdgpu-install -y
    
#fixes AMD HIP issure on blender
# https://askubuntu.com/questions/1434988/blender-3-3-does-not-recognize-my-gpu-for-hip-on-ubuntu-20-04
    sudo usermod -a -G video $USER 
    sudo usermod -a -G render $USER

    git config --global user.name "trevor256"
    git config --global user.email "256trevor@gmail.com"