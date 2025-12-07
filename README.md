# RTL8188EUS Kali Setup Scripts


This repository contains scripts to easily install the patched Aircrack-NG RTL8188EUS driver on Kali Linux. These scripts automate:
- Driver installation
- Driver blacklist
- Kernel header installation
- Packet injection configuration
- Monitor mode enablement & testing


---


## ▶️ Installation
Clone and enter the folder:


```bash
git clone https://github.com/yourname/rtl8188eus-setup.git
cd rtl8188eus-setup

##Make scripts executable:
chmod +x setup_rtl8188eus.sh wifi_test.sh

##Run installation:
sudo ./setup_rtl8188eus.sh

##Reboot afterward:
sudo reboot

# Monitor Mode + Packet Injection
sudo ./wifi_test.sh
