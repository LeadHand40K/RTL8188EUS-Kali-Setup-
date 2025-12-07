#!/bin/bash


echo "=== RTL8188EUS Adapter Setup Script ==="


if [ "$EUID" -ne 0 ]; then
echo "Run with sudo: sudo bash setup_rtl8188eus.sh"
exit 1
fi


echo "[1/8] Updating system..."
apt update && apt upgrade -y


echo "[2/8] Installing required tools..."
apt install -y bc build-essential libelf-dev dkms


echo "[3/8] Installing kernel headers..."
apt-get install -y linux-headers-$(uname -r)


echo "[4/8] Removing conflicting Realtek driver..."
rmmod r8188eu.ko 2>/dev/null


echo "[5/8] Cloning patched driver..."
if [ ! -d "rtl8188eus" ]; then
git clone https://github.com/aircrack-ng/rtl8188eus
else
echo "Repo already exists, skipping clone."
fi


echo "[6/8] Blacklisting stock driver..."
echo "blacklist r8188eu" > /etc/modprobe.d/realtek.conf


echo "[7/8] Building driver..."
cd rtl8188eus
make
make install


echo "[8/8] Loading new driver..."
modprobe 8188eu


echo "=== Setup Complete — Reboot Recommended ==="
