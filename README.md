# Ubuntu-Fixer
This repository has a variety of bash scripts that will "fix" Ubuntu, removing all traces of Snap and the Snap Store, and replacing it with Flatpak and Gnome Software (or KDE Discover). There is a similar script by Alan Pope called [unsnap](https://github.com/popey/unsnap|unscript). The only difference between unsnap and Ubuntu-Fixer is that Ubuntu-Fixer installs GNOME Software (gnome-software) and the GNOME Software Flatpak Plugin (gnome-software-plugin-flatpak), so after running the script, you have a GUI for managing Flatpak applications.

### Some Background
I am not new to bash programming, but I am inexperienced. I have been messing with bash for a while, but it has always been very simple things like making scripts to automatically update my homelab. If I'm being honest, the solution to removing all of the snaps feels pretty janky, but I think it gets the job done. There was an issue where some snaps would depend on others to work, and that's where the jank actually arises. Basically, I originally had a block of code that did snap list and piped that into an awk command that would ignore the header, and only list the first column, which contained the actual names of the packages (by the way screw Canonical for not having a --quiet option). That didn't work because snap list lists the packages in alphabetical order, and some of the packages depended on others, for example, the first package, base, was depended on by gtk-common-themes. That has since been changed to pipe the awk command into a grep command that ignores those packages and removes them later, after all the packages that depend on them are removed. It would be nice if there was a snap force remove command, but no, there's not, thanks Canonical.

### What's Coming
I am still yet to make scripts for the Ubuntu flavors, however, those shouldn't bee too hard to add because they will be very similar to (and possibly the same as), the Ubuntu script. The only possible differences are Kubuntu and Lubuntu already coming with Discover, and some possible different qt packages.

### The Goal
The goal of this script is to avoid throwing the baby out with the bathwater. Ubuntu has quite a few good aspects. It is a more complete version of debian, coming with necessary user tools, it has well maintained repositories based on the debian testing repos, and, unlike other distros, it actually integrates well with less popular desktop environments like lxqt, xfce, and mate. The only real Downside to Ubuntu is snaps.

### How to Use
To use the Ubuntu Fixer, copy the raw contents of the text file that you need (for Ubuntu it is Ubuntu-Fixer.sh) into a text file, name it Ubuntu-Fixer.sh, go into Ubuntu-Fixer.sh Properties, turn on "Executeable as Program", exit properties, right click it, and then click "Run as a Program". Hopefully later I can make a simpler way to do the same thing.
It is recommended that you do this on a fresh install to avoid losing any data attached to your snaps, but the script should work regardless.

### Credits
[Alan Pope](https://github.com/popey) just in case my script is considered too similar, I didn't copy what he did, I just want to credit him for doing what I did, but doing it first and better.
[Network Chuck](https://github.com/theNetworkChuck) for originally getting me into bash programming and teaching me the basics.
[Fritz](https://github.com/Fritzy-G) for offering to make Ubuntu Virtual Machines and test the script, even though he couldn't because his Virtual Machine software wasn't working, he still tried, so I'm giving credit where credit is due.
[GitHub Copilot](https://github.com/copilot) for helping me debug and find syntax errors.
And most importantly...
[ChatGPT](chatgpt.com) for teaching me almost everything I know about bash programming.
