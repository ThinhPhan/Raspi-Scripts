#!/bin/bash
# Date: 07.01.2017
# Version: 1.0
# Author: Vincent Phan
# Strip down Raspian to Server Edition - Headless

rm -rf python_games
rm -rf Public Videos Music Pictures

sudo apt-get update
sudo apt-get purge xserver* -y
sudo apt-get purge ^x11 -y
sudo apt-get purge ^libx -y
sudo apt-get purge ^lx -y
sudo apt-get purge samba* -y
sudo apt-get purge supercollider* -y
sudo apt-get purge netsurf* -y
sudo apt-get purge omxplayer -y
sudo apt-get purge ^epiphany-browser -y
sudo apt-get purge sonic-pi -y
sudo apt-get purge wolfram-engine -y
sudo apt-get purge scratch -y
sudo apt-get purge penguinspuzzle -y
sudo apt-get purge desktop-base -y
sudo apt-get purge lightdm -y
sudo apt-get purge obconf -y
sudo apt-get purge openbox -y
sudo apt-get purge raspberrypi-artwork -y

sudo apt-get autoremove -y

sudo apt-get upgrade -y

sudo apt-get clean