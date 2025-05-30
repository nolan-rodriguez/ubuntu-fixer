# Ubuntu-Fixer
This repository has a variety of bash scripts that will "fix" Ubuntu, removing all traces of Snap and the Snap Store, and replacing it with Flatpak and Gnome Software (or KDE Discover). There is a similar script by Alan Pope called [unsnap](https://github.com/popey/unsnap|unscript). The only difference between unsnap and Ubuntu-Fixer is that Ubuntu-Fixer installs GNOME Software (gnome-software) and the GNOME Software Flatpak Plugin (gnome-software-plugin-flatpak), so after running the script, you have a GUI for managing Flatpak applications.
Note that Ubuntu-Fixer.sh has been tested but not fully debugged yet, so it probably doesn't work right now. Be patient (because you may be waiting a while), this is a one-man job, so hopefully I will finish debugging it at some point...

### What's Coming
I am still yet to make scripts for the Ubuntu flavors, however, those shouldn't bee too hard to add because they will be very similar to (and possibly the same as), the Ubuntu script. The only possible differences are

### The Goal
The goal of this script is to avoid throwing the baby out with the bathwater. Ubuntu has quite a few good aspects. It is a more complete version of debian, coming with necessary user tools, it has well maintained repositories based on the debian testing repos, and, unlike other distros, it actually integrates well with less popular desktop environments like lxqt, xfce, and mate. The only real Downside to Ubuntu is snaps.

### How to Use
To use the ubuntu fixer, run the following command:
```
curl -fsSL https://raw.githubusercontent.com/Nolan-Rodriguez/Ubuntu-Fixer/refs/heads/main/Ubuntu-Fixer.sh | sh
```
It is recommended that you do this on a fresh install to avoid losing any data attached to your snaps, but the script should work regardless.
