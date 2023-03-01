#!/bin/sh
###########################################################
#  Author https://github.com/trevor256
#  script configs Ubuntu Desktop
#  Linux OS (Ubuntu 22.10)
###########################################################

    sudo apt update && sudo apt upgrade -y 

#Apt install git ffmpeg mysql-client-core-8.0 openjdk-17-jdk openjdk-17-jre kdenlive
#Snap install GO, Node, aws-cli, google-cloud-cli, blender, discord, krita, postman, obs, inkscape, VScode, terraform, remmina 
    sudo apt install git ffmpeg openjdk-17-jdk openjdk-17-jre kdenlive -y &
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
    sudo snap install terraform --classic
    sudo snap install remmina
    sudo snap install chromium

#Downloads Radeon GPU and installs
    lspci | grep 'Radeon RX' && wget https://repo.radeon.com/amdgpu-install/22.40.3/ubuntu/jammy/amdgpu-install_5.4.50403-1_all.deb
    lspci | grep 'Radeon RX' && sudo dpkg -i amdgpu-install_5.4.50403-1_all.deb && amdgpu-install -y

#Fixes AMD HIP issues for blender
#https://askubuntu.com/questions/1434988/blender-3-3-does-not-recognize-my-gpu-for-hip-on-ubuntu-20-04
    sudo usermod -a -G video $USER 
    sudo usermod -a -G render $USER

#Huion tablet drivers
    wget https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb
    sudo dpkg -i HuionTablet_v15.0.0.89.202205241352.x86_64.deb
    
#Add Git name and email
    git config --global user.name "trevor256"
    git config --global user.email "256trevor@gmail.com"

#Clean up and Restart
    sudo rm HuionTablet_v15.0.0.89.202205241352.x86_64.deb amdgpu-install_5.4.50401-1_all.deb amdgpu-install_5.4.50401-1_all.deb 
    init 6
