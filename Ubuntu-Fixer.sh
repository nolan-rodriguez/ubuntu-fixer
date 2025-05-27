#!/bin/bash

# Upgrade System
echo 'Upgrading System...'
sudo apt update -y && sudo apt upgrade -y

# Remove Snap
echo 'Removing Snap...'
sudo apt remove --purge snap snapd snap-store -y
sudo apt autoremove -y

# Add nosnap.pref File to /etc/apt/preferences.d
sudo touch /etc/apt/preferences.d/nosnap.pref
sudo echo 'Package: snapd' >> /etc/apt/preferences.d/nosnap.pref
sudo echo 'Pin: release a=*' >> /etc/apt/preferences.d/nosnap.pref
sudo echo 'Pin-Priority: -10' >> /etc/apt/preferences.d/nosnap.pref

# Install Gnome Software
sudo apt install gnome-software

# Install Flatpak
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
