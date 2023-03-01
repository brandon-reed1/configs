# <h1 align="center">Configuration files that install systems or solve solutions.</h1>
### <img align="left" width="30px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/docker.svg"> docker folder - contains docker compose YAML files

### <img align="left" width="30px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/solutions.svg"> solutions folder - contains solutions to various issues

###  <img align="left" width="30px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/terraform.svg"> terraform folder - contains .tf scripts to build cloud solutions 

</br>

### <h1>Configure Desktop with the curl or wget commands bellow</h1>
# [Ubuntu 22](https://ubuntu.com/download/desktop) Linux Desktop<img align="left" width="50px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/Ubuntu.svg">
```bash
curl https://raw.githubusercontent.com/trevor256/configs/main/desktop_ubuntu.sh | sudo sh
```
```bash
wget -O - -o /dev/null https://raw.githubusercontent.com/trevor256/configs/main/desktop_ubuntu.sh | sudo sh
```

# [Fedora](https://getfedora.org) Linux Desktop<img align="left" width="50px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/fedora.svg">
```bash
curl https://raw.githubusercontent.com/trevor256/configs/main/desktop_fedora.sh | sudo sh
```
```bash
wget -O - -o /dev/null https://raw.githubusercontent.com/trevor256/configs/main/desktop_fedora.sh | sudo sh
```

# [Windows 11](https://www.microsoft.com/software-download/windows11) Desktop <img align="left" width="50px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/Windows.svg">
```powershell
. { iwr -useb https://raw.githubusercontent.com/trevor256/configs/main/desktop_windows.ps1 } | iex; install
```
</br>

### <h1>Configure Server with thr curl or wget commands bellow</h1>
# [Debian 11](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso) Linux Server <img align="left" width="50px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/debian.svg">
```bash
curl https://raw.githubusercontent.com/trevor256/configs/main/server_debian.sh | sudo sh
```
```bash
wget -O - -o /dev/null https://raw.githubusercontent.com/trevor256/configs/main/server_debian.sh | sudo sh
```
# [RHEL](https://developers.redhat.com/products/rhel/download) Linux Server <img align="left" width="50px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/rhel.svg">
```bash
curl https://raw.githubusercontent.com/trevor256/configs/main/server_rhel.sh | sudo sh
```
```bash
wget -O - -o /dev/null https://raw.githubusercontent.com/trevor256/configs/main/server_rhel.sh | sudo sh
```
# [Windows 2022](https://www.microsoft.com/en-us/windows-server/triald) Server <img align="left" width="50px" src="https://raw.githubusercontent.com/trevor256/trevor256/main/imgs/Windows.svg">
```powershell
. { iwr -useb https://raw.githubusercontent.com/trevor256/configs/main/server_windows.ps1 } | iex; install
```
