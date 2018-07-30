#!/bin/sh
# Raspian stripped down to its bare bones runs only the absolutely
# essential software and it can be useful when you want a lean system.
#
# Step 1: Boot to command line
# Step 2: Remove X desktop and dependent package
# Step 3: Remove other packages

echo "Removing desktop packages"
sudo apt-get remove --purge desktop-base lightdm lxappearance lxde-common lxde-icon-theme lxinput lxpanel lxpolkit lxrandr lxsession-edit lxshortcut lxtask lxterminal

echo "Removing wolfram-engine"
sudo apt-get  remove --purge wolfram-engine

echo "Removing X-packages"
sudo apt-get remove --purge obconf openbox raspberrypi-artwork xarchiver xinit xserver-xorg xserver-xorg-video-fbdev x11-utils x11-common x11-session utils

echo "Cleaning up"
sudo apt-get autoremove -purge
