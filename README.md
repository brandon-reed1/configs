# These are configuration files used to install new systems or solve solutions.
## docker folder - contains docker images
## solutions folder - contains solutions to various issues
## terraform folder- contains build scripts for cloud solutions 

# Configure [Ubuntu](https://ubuntu.com/download/desktop) Linux Desktop<img align="right" width="70px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/debian.svg">
```bash
wget https://raw.githubusercontent.com/trevor256/myconfigs/main/my_ubuntu.sh && sudo bash my_ubuntu.sh 
```
# Configure Windows [10](https://neon.kde.org/download) Desktop <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/win.svg">

```powershell
. { iwr -useb https://raw.githubusercontent.com/trevor256/MyConfig/main/windows.ps1 } | iex; install
```
# Configure [Fedora](https://getfedora.org) Linux Desktop<img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/fedora.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/fedora.sh | sudo bash
```
# Configure Server [Debian 11](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso) <img align="right" width="80px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/debian.svg">
```bash
curl -L https://raw.githubusercontent.com/trevor256/MyConfig/main/server.sh | sudo bash
```
