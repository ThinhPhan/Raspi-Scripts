#!/bin/bash
# Date: 07.01.2017
# Version: 1.0
# Author: Vincent Phan
# Strip down Raspian to Desktop Edition

list_programs=list_programs.txt


rm -rf Public Videos Music Pictures Desktop python_games

#  Mathematica (460MB) and scratch (67MB), Wolfram (658MB), Libreoffice (253MB)
sudo apt-get remove --purge $(cat $list_programs) -y

# purge - remove packages & config files
sudo apt-get purge supercollider* netsurf* sonic-pi penguinspuzzle raspberrypi-artwork -y
sudo apt-get install localepurge
sudo localepurge

# remove automatically all unused packages
sudo apt-get autoremove -y
sudo apt-get update -y
sudo apt-get upgrade -y
# Update firmwares
sudo rpi-update

sudo apt-get clean
sudo apt-get autoclean