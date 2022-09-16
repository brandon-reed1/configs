#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new system
#  Linux OS (fedora)
########################################
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM


sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora36/x86_64/cuda-fedora36.repo

sudo dnf makecache -y
sudo dnf upgrade --refresh -y
sudo dnf -y install go rust cargo nodejs awscli google-cloud-cli docker blender nmap inkscape zsh
sudo dnf -y module install nvidia-driver:latest-dkms

git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/MyConfig.git github/MyConfig/
git clone https://github.com/trevor256/BSFSB github/BSFSB/
git clone https://github.com/trevor256/erupt-0.2.git github/erupt-0.2/
chmod -R 777 github

echo "starship and nerdfonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> .bashrc

echo "install nvidia driver? y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
    else
       echo "${RED}${bold}  nvidia driver not installed${NC}${normal}"
    fi

echo "${GREEN}${bold} rebooting......${NC}${normal}"
sudo dnf upgrade --refresh -y
reboot
