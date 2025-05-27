#!/bin/bash

# Warn User
while true; do
    # Warning Prompt
    read -p "WARNING! Proceeding will remove all snap packages and all data tied to them. Do you wish to proceed? (Y/n): " warning_response

    # Default to "y" if the user just presses Enter
    if [[ -z "$warning_response" ]]; then
        warning_response="y"
    fi

    # Check the user's response
    if [[ "$warning_response" == "y" || "$warning_response" == "Y" ]]; then
        echo "Proceeding with the removal of snap packages..."
        break  # Exit the loop after proceeding
    elif [[ "$warning_response" == "n" || "$warning_response" == "N" ]]; then
        echo "Operation canceled"
        exit  # Exit the script
    else
        echo "Invalid response. Please enter 'y' for yes or 'n' for no."
        # The loop will continue, prompting the user again
    fi
done

# Upgrade System
echo "Upgrading System..."
sudo apt update -y && sudo apt upgrade -y

# Remove Snap
echo "Removing Snap..."
sudo apt remove --purge snap snapd snap-store -y

# Add nosnap.pref File to /etc/apt/preferences.d
#
#
#
#
#

# Install Gnome Software
echo "Installing Gnome Software"
sudo apt install gnome-software -y

# Install Flatpak
echo "Installing Flatpak"
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Upgrade System
echo "Upgrading System"
sudo apt update -y && sudo apt upgrade -y

# Ask if the User wants to Reboot now or later
while true; do
    # Prompt the user for input
    read -p "Do you want to reboot now or later? (now/later): " response

    # Check the user's response
    if [[ "$response" == "now" ]]; then
        echo "Rebooting now..."
        sudo reboot
        break  # Exit the loop after rebooting
    elif [[ "$response" == "later" ]]; then
        echo "Please save your work and reboot soon."
        break  # Exit the loop after acknowledging the choice
    else
        echo "Invalid response. Please enter 'now' or 'later'."
        # The loop will continue, prompting the user again
    fi
done
