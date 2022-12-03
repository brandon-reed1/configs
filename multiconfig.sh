
    #!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on KDE NEON Linux to config new install https://neon.kde.org/download
##  make a usb sudo dd bs=4M if=Downloads/neon.iso of=/dev/sd<?> conv=fdatasync status=progress 
##

## Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"




debian (){
    echo "${GREEN}configuring debian${NONE}"
    echo "${GREEN}nonfree repositories and updating${NONE}"
sudo apt-add-repository non-free
sudo apt-add-repository contrib
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get update -y && sudo apt-get upgrade

echo "${GREEN}git config${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
echo "input github token:"
read gittoken
sudo echo 'GITHUB_TOKEN="'$gittoken'"' >> .bashrc
mkdir gh
chmod 777 -R gh

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

}




neon (){
    echo "configuring KDE Neon"

GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

echo "${GREEN} Adding repositories and updating${NONE}"
curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo pkcon update -y

echo "${GREEN} Install nvidia driver 515?${NONE}"
sudo apt-get install nvidia-driver-515
      
echo "${GREEN} Snap install GO, aws-cli, google-cloud-cli, nvim${NONE}"
sudo snap install go --classic 
sudo snap install aws-cli --classic 
sudo snap install google-cloud-cli --classic 
sudo snap install nvim --classic

echo "${GREEN} Downloading github projects to /github dir${NONE}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
echo "[credential "https://github.com"]" >> .gitconfig
echo "input github token:"
read gittoken
sudo echo 'username = '$gittoken'' >> .gitconfig
sudo echo 'password = '$gittoken'' >> .gitconfig
mkdir gh

echo "${GREEN} Installing starship and nerdfonts${NONE}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "eval '$(starship init bash)'" >> .bashrc

## https://develop.kde.org/docs/extend/plasma/scripting/templates/
#echo "${GREEN} Changing KDE NEON settings${NONE}"
#lookandfeeltool -a 'org.kde.breeze.desktop' --resetLayout

echo "${GREEN} Install Huion graphics tablet driver${NONE}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN} apt install nodejs, ffmpeg, build-essential shellcheck${NONE}"
sudo apt-get install -y nodejs ffmpeg build-essential shellcheck

echo "${GREEN} Flatpak install kdenlive, Blender, LibreOffice, Discord, Boxes, Inkscape, Krita, postman, Godot, Audacity, ATMinecraft, OBS${NONE}"
sudo flatpak install -y flathub org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord org.gnome.Boxes md.obsidian.Obsidian \
com.getpostman.Postman org.kde.krita org.godotengine.GFodot org.inkscape.Inkscape org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio
       
init 6

}




fedora (){
    echo "configuring fedora"
    sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf makecache -y
sudo dnf upgrade --refresh -y
sudo dnf -y install go nodejs awscli google-cloud-cli blender nmap inkscape timeshift
sudo flatpak install flathub org.kde.krita com.getpostman.Postman com.discordapp.Discord org.godotengine.GFodot com.atlauncher.ATLauncher com.obsproject.Studio -y
sudo dnf install akmod-nvidia

git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir gh
sudo chmod 777 gh
sudo dnf upgrade --refresh -y
}




rockyx86 (){
    echo "configuring rocky x86 server"

}



rockyarm (){
    echo "configuring rocky arm server"

}


if hostnamectl | grep -q "Debian"; 
then
    echo "this is debian"
    debian
fi

if hostnamectl | grep -q "Neon"; 
then
    echo "this is neon"
    neon
fi

if hostnamectl | grep -q "Fedora"; 
then
    echo "this is fedora"
    fedora
fi

if hostnamectl | grep -q "rocky"; 
then
    echo "this is rocky x86 server"
    rockyx86
fi

if hostnamectl | grep -q "rocky"; 
then
    echo "this is rocky arm server"
    rockyarm
fi