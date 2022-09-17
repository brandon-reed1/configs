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

sudo dnf makecache -y
sudo dnf upgrade --refresh -y
sudo dnf -y install go rust cargo nodejs awscli google-cloud-cli docker blender nmap inkscape zsh
sudo dnf -y module install nvidia-driver:latest-dkms

git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"

echo "starship and nerdfonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> .bashrc

echo "${GREEN}${bold} rebooting......${NC}${normal}"
sudo dnf upgrade --refresh -y
reboot
