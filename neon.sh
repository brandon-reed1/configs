#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on KDE NEON Linux to config new install https://neon.kde.org/download
##  make a usb sudo dd bs=4M if=Downloads/neon.iso of=/dev/sd<?> conv=fdatasync status=progress 
##

## Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

## Function adds yes or no options to commands
function yes_or_no {
    while true; do
        read -p -r "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}


echo "${GREEN} Adding repositories and updating${NONE}"
curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo pkcon update -y

echo "${GREEN} Install nvidia driver 515?${NONE}"
yes_or_no "$@" && sudo apt-get install nvidia-driver-515 -y
      
echo "${GREEN} Snap install GO, aws-cli, google-cloud-cli, nvim${NONE}"
sudo snap install go --classic 
sudo snap install aws-cli --classic 
sudo snap install google-cloud-cli --classic 
sudo snap install nvim --classic

echo "${GREEN} Downloading github projects to /github dir${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir gh

echo "${GREEN} Installing starship and nerdfonts${NONE}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "eval '$(starship init bash)'" >> .bashrc

echo "${GREEN} Install Huion graphics tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN} apt install nodejs, ffmpeg, build-essential${NONE}"
sudo apt-get install -y nodejs ffmpeg build-essential 

echo "${GREEN} Flatpak install kdenlive, Blender, LibreOffice, Discord, Inkscape, Krita, Godot, Audacity, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord \
org.kde.krita org.godotengine.GFodot org.inkscape.Inkscape org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio
       
init 6
