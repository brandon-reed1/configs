# Configure [KDE Neon](https://neon.kde.org/download) Linux Desktop<img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/neon.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/neonDesktop.sh -o config.sh && sudo bash config.sh
```
Script will
  1. pkcon update
  2. installs GO, Rust, Node-17/npm/yarn
  3. installs aws, azure, gcp, and terraform cli
  4. Installs kdenlive, ktorrent, krita, ffmpeg, build-essential, nmap, moc, moc-ffmpeg-plugin, 
     vim, nvim, ktorrent blender, libreoffice, discord, Inkscape, gnomeBoxes, godotengine, 
     videodownloader, bootqt, libllvm6.0, Audacity, OBS, marktext..
  6. config git user and clones my github projects 
  7. installs drivers for xpen 
  8. changes theme to breezedark 
  9. ask to install nvidia driver 
  10. removes xpen.deb go.gz awscliv2.zip
  11. pkcon update
  12. asks to reboot

# Configure [Fedora](https://getfedora.org) Linux Desktop<img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/fedora.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/fedoraDesktop.sh | sudo bash
```
Script will
  1. pkcon update
  2. install nvidia driver 515
  3. Install Go, Rust, Node
  4. Install AWS, GCP, Docker
  6. config git user and clones my github projects 
  7. installs drivers for xpen 
  8. apt-get install ffmpeg build-essential openjdk-17-jdk openjdk-17-jre python3-pip python3-virtualenv rustc cargo
  9. flatpak install flathub io.neovim.nvim org.kde.kdenlive org.blender.Blender org.libreoffice.LibreOffice com.discordapp.Discord org.kde.krita org.godotengine.GFodot
  10. flatpak install org.inkscape.Inkscape com.github.unrud.VideoDownloader org.audacityteam.Audacity com.atlauncher.ATLauncher com.obsproject.Studio
  11. reboot

# Configure Windows [10](https://neon.kde.org/download) Desktop <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/win.svg">

```powershell
. { iwr -useb https://raw.githubusercontent.com/trevor256/MyConfig/main/WindowsDesktop.ps1 } | iex; install
```
Script will
  1. pkcon update
  2. installs GO, Rust, Node-17/npm/yarn
  3. installs aws, azure, gcp, and terraform cli
  4. apt-get install  kdenlive, krita, ffmpeg, build-essential, kate, shellcheck, nmap, moc, moc-ffmpeg-plugin, nvim, htop, fzf


# Configure Server [Debian 11](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso) <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/debian.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/Server.sh | sudo bash
```
Script will
  1. pkcon update
  2. installs GO, Rust, Node-17/npm/yarn
  3. installs aws, azure, gcp, and terraform cli
  4. apt-get install  kdenlive, krita, ffmpeg, build-essential, kate, shellcheck, nmap, moc, moc-ffmpeg-plugin, nvim, htop, fzf
