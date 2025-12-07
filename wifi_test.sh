#!/bin/bash


echo "=== Enabling Monitor Mode ==="


sudo ifconfig wlan0 down
sudo airmon-ng check kill
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up


echo "=== Wireless Status ==="
iwconfig


echo "=== Testing Packet Injection ==="
sudo aireplay-ng --test wlan0
