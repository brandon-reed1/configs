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
sudo dnf -y install go nodejs awscli google-cloud-cli blender nmap inkscape ffmpeg-libs
sudo flatpak install flathub org.kde.krita com.getpostman.Postman com.discordapp.Discord org.godotengine.GFodot \
com.atlauncher.ATLauncher com.obsproject.Studio

git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir gh

sudo dnf upgrade --refresh -y
