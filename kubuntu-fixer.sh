#!/bin/bash

# Exit on Error
set -e

# Loops warning until read command gets a valid response
while true; do 
    # Warn user and read and record response as warning_response
    read -p 'WARNING! Proceeding will remove all snap packages and all data tied to them. Do you want to continue? [Y/n]: ' warning_response

    # Default to "y" if the user just presses Enter
    if [[ -z "$warning_response" ]]; then
        warning_response="y"
    fi

    # Check the user's response
    if [[ "$warning_response" == "y" || "$warning_response" == "Y" ]]; then
        echo "Proceeding with the removal of snap packages..."
        break  # Exit the loop and proceed
    elif [[ "$warning_response" == "n" || "$warning_response" == "N" ]]; then
        echo "Operation canceled"
        exit  # Exit the script
    else
        echo 'Invalid response. Please enter "y" for yes or "n" for no.'
        # The loop will continue, prompting the user again
    fi
done

# Upgrade System
echo 'Upgrading System...'
sudo apt update -y && sudo apt upgrade -y

# Removing Snap Applications
echo 'Removing Snap applications...'
# Remove all user/application snaps (excluding bases and themes)
while true; do
    # List snaps and remove them one by one
    for snap in $(snap list | awk 'NR>1 {print $1}'); do
        echo "Removing $snap..."
        sudo snap remove "$snap" || true
    done

    # Check if there are any snaps left
    if [ -z "$(snap list | awk 'NR>1 {print $1}')" ]; then
        echo "All Snaps have been successfully removed."
        break
    fi
done

# Remove Snap
echo 'Removing Snap...'
sudo apt remove --purge snap snapd -y

# Add nosnap.pref File to /etc/apt/preferences.d
echo -e 'Package: snapd\nPin: release a=*\nPin-Priority: -10' | sudo tee /etc/apt/preferences.d/nosnap.pref > /dev/null

# Install Flatpak
echo 'Installing Flatpak...'
sudo apt install flatpak -y
echo 'Installing Flatpak Backend for KDE Discover...'
sudo apt install plasma-discover-backend-flatpak -y
echo 'Installing Flatpak Permissions Managment...'
sudo apt install kde-config-flatpak
echo 'Adding Flathub remote...'
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Upgrade System... Again
echo 'Upgrading System...'
sudo apt update -y && sudo apt upgrade -y

# Autoremove Packages
echo 'Removing unnecessary packages...'
sudo apt autoremove -y

# Ask if the User wants to Reboot now or later
while true; do
    # Warning Prompt
    read -p 'Do you want to reboot? [Y/n]: ' reboot_response

    # Default to "y" if the user just presses Enter
    if [[ -z "$reboot_response" ]]; then
        reboot_response="y"
    fi

    # Check the user's response
    if [[ "$reboot_response" == "y" || "$reboot_response" == "Y" ]]; then
        echo 'Rebooting...'
        sudo reboot
        break  # Exit the loop after proceeding
    elif [[ "$reboot_response" == "n" || "$reboot_response" == "N" ]]; then
        echo "Please reboot soon."
        exit  # Exit the script
    else
        echo 'Invalid response. Please enter "y" for yes or "n" for no.'
        # The loop will continue, prompting the user again
    fi
done
