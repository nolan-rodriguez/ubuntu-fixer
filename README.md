# Ubuntu-Fixer
This repository has a variety of bash scripts that will "fix" Ubuntu, removing all traces of Snap and the Snap Store, and replacing it with Flatpak and Gnome Software (or KDE Discover).

# NOTE THAT Ubuntu-Fixer.sh IS UNTESTED AS OF NOW, THIS LINE WILL BE REMOVED ONCE IT IS CONFIRMED WORKING!!!

### What's Coming
I am still yet to make scripts for the Ubuntu flavors, however, those shouldn't bee too hard to add because they will be very similar to (and possibly the same as), the Ubuntu script.

### The Goal
The goal of this script is to avoid throwing the baby out with the bathwater. Ubuntu has quite a few good aspects. It is a more complete version of debian, coming with necessary user tools, it has well maintained repositories based on the debian testing repos, and, unlike other distros, it actually integrates well with desktop environments like lxqt, xfce, and mate. The only real Downside to Ubuntu is snaps.

### How to Use
To use the ubuntu fixer, run the following command:
```
curl -fsSL https://raw.githubusercontent.com/Nolan-Rodriguez/Ubuntu-Fixer/refs/heads/main/Ubuntu-Fixer.sh | sh
```
It is recommended that you do this on a fresh install to avoid losing any data attached to your snaps, but the script should work regardless.
