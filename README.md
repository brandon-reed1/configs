# Script configure new [KDE Neon](https://neon.kde.org/download) install
### Download & Run
```
curl -L https://raw.githubusercontent.com/trevor256/LinuxConfig/main/config.sh -o c.sh && sh c.sh
```
Script will
 1. pkcon update
 2. install languages GO, Rust, Node-17/npm/yarn
 3. installs aws, azure, gcp terraform cli
 4. apt-get install  kdenlive, krita, ffmpeg, build-essential, kate, shellcheck, nmap, moc, moc-ffmpeg-plugin, nvim, htop, moc, browsh, fzf
 5. flatpak install blender, libreoffice, discord, Inkscape, gnomeBoxes, godotengine, videodownloader, Nixwriter, libllvm6.0, Audacity, OBS
 6. config git user and clones my github projects
 7. installs drivers for xpen 
 8. ask to install driver nvidia
 9. changes theme to breezedark 
 10. removes xpen.deb go.gz awscliv2.zip
 11. pkcon update
 12. asks to remove the script and reboots
