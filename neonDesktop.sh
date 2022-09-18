#!/bin/bash
#  Author https://github.com/trevor256
#  script configs new system
#  Run on Linux (KDE NEON)
#  make a usb   sudo dd bs=4M if=Downloads/neon.iso of=/dev/sd<?> conv=fdatasync status=progress
GREEN="$(tput setaf 2)"
NC="$(tput sgr0)"

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

echo "${GREEN} Updating${NC}"
sudo pkcon update -y
sudo add-apt-repository ppa:neovim-ppa/unstable

echo "${GREEN} Install nvidia driver 515?${NC}"
yes_or_no "$message" && sudo apt-get install nvidia-driver-515 -y
      
echo "${GREEN} Snap installing GO Rust Node aws-cli google-cloud-cli${NC}"
sudo snap install go --classic 
sudo snap install rustup --classic 
sudo snap install node --classic 
sudo snap install aws-cli --classic 
sudo snap install google-cloud-cli --classic 

echo "${GREEN} Downloading github projects to /github dir${NC}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
mkdir gh

echo "${GREEN} Installing starship and nerdfonts${NC}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> .bashrc

echo "${GREEN} Install Huion${NC}"
curl https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.89.202205241352.x86_64.deb -o huion.deb && sudo dpkg -i huion.deb

echo "${GREEN} apt install docker ffmpeg build-essential openjdk-17-jdk openjdk-17-jre python3-pip python3-virtualenv${NC}"
sudo apt-get install docker.io neovim ffmpeg build-essential openjdk-17-jdk openjdk-17-jre python3-pip python3-virtualenv rustc cargo -y
echo "${GREEN} flatpak install nvim kdenlive Blender LibreOffice Discord Inkscape krita Godot VideoDownloader Audacity Minecraft obs${NC}"
sudo flatpak install flathub org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord org.kde.krita org.godotengine.GFodot -y 
sudo flatpak install org.inkscape.Inkscape com.github.unrud.VideoDownloader org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio -y
mkdir .config/nvim/
curl https://raw.githubusercontent.com/trevor256/MyConfig/main/other/init.vim -o .config/neovim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
init 6
