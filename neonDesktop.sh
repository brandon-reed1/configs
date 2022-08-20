#!/bin/bash
####
#  Author https://github.com/trevor256
#  script configs new system
#  Run on Linux OS (KDE NEON)
# make a usb      lsblk           sudo dd bs=4M if=Downloads/neon.iso of=sd<?> conv=fdatasync status=progress
####

GREEN="$(tput setaf 2)"
NC="$(tput sgr0)"

echo "${GREEN} Updating${NC}"
sudo pkcon update -y

echo "${GREEN} apt install kubectl htop cmus ffmpeg build-essential openjdk-17-jdk openjdk-17-jre python3-pip python3-virtualenv${NC}"
sudo apt-get install ffmpeg build-essential openjdk-17-jdk openjdk-17-jre python3-pip python3-virtualenv -y
echo "${GREEN} flatpak install ktorrent kdenlive Blender LibreOffice Discord marktext Inkscape krita Godot VideoDownloader Audacity Minecraft obs${NC}"
sudo flatpak install flathub org.kde.ktorrent org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord com.github.marktext.marktext org.inkscape.Inkscape org.kde.krita org.godotengine.GFodot com.github.unrud.VideoDownloader org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio -y

echo "${GREEN} Installing nvim${NC}"
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin
mkdir -p .config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "${GREEN} Installing starship and nerdfonts${NC}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> .bashrc

echo "${GREEN} Installing GO${NC}"
curl -OL https://go.dev/dl/go1.19.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.19.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile

echo "${GREEN} Installing Rust, rustc, cargo${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
sudo apt-get install rustc cargo -y

echo "${GREEN} Installing Node 17 & NPM yarn${NC}"
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g nodemon yarn

echo "${GREEN} Installing AWS CLI${NC}"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "${GREEN} Installing AWS EB CLI${NC}"
sudo pip3 install awsebcli --force-reinstall --upgrade

echo "${GREEN} Installing GCP CLI${NC}"
sudo apt-get install apt-transport-https ca-certificates gnupg -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update -y && sudo apt-get install google-cloud-cli -y

echo "${GREEN} Monero CLI${NC}"
wget https://downloads.getmonero.org/linux64 && tar jxvf linux64 -y
# ./monerod &
# ./monero-wallet-cli

echo "${GREEN} Solana CLI${NC}"
sh -c "$(curl -sSfL https://release.solana.com/v1.10.29/install)" -y

echo "${GREEN} Stripe CLI${NC}"
curl https://packages.stripe.dev/api/security/keypair/stripe-cli-gpg/public | sudo apt-key add -
echo "deb https://packages.stripe.dev/stripe-cli-debian-local stable main" | sudo tee -a /etc/apt/sources.list
sudo apt update -y
sudo apt install stripe -y

echo "${GREEN} docker${NC}"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo "${GREEN} Downloading github projects to /github dir${NC}"
git config --global user.name "trevor256"
git config --global user.email "256trevor@gmail.com"
git clone https://github.com/trevor256/trevor256.com.git github/trevor256.com/
git clone https://github.com/trevor256/MyConfig.git github/MyConfig/
git clone https://github.com/trevor256/BSFSB github/BSFSB/
git clone https://github.com/trevor256/erupt-0.2.git github/erupt-0.2/
chmod -R 777 github

echo "${GREEN} Install Xpen${NC}"
curl https://www.xp-pen.com/download/file/id/1949/pide819/ext/deb.html -o xpen.deb
sudo dpkg -i xpen.deb
sudo rm xpen.deb go1.18.1.linux-amd64.tar.gz awscliv2.zip
lookandfeeltool -a 'org.kde.breezedark.desktop'

echo "${GREEN} install nvidia driver 515?${NC} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then
      sudo apt-get install nvidia-driver-515 -y
    else
       echo "${RED}  nvidia driver not installed${NC}"
    fi

echo "${GREEN} rebooting......${NC}"
sudo pkcon update -y
init 6
