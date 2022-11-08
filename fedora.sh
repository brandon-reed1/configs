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

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf makecache -y
sudo dnf upgrade --refresh -y
sudo dnf -y install go rust cargo nodejs awscli google-cloud-cli blender nmap inkscape ffmpeg-libs
sudo flatpak install flathub org.kde.krita com.getpostman.Postman com.discordapp.Discord org.godotengine.GFodot \
com.atlauncher.ATLauncher com.obsproject.Studio

git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir gh

echo "${GREEN}${bold} rebooting......${NC}${normal}"
sudo dnf upgrade --refresh -y
reboot
