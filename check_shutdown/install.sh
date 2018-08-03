#!/bin/bash

# -------------------------------------------------------------------------
# Script: install.sh
# Purpose: Configure to install Shutdown Check Service.
# Author: Vincent Phan <vincent.phan@firstidea.vn> under GPL v2.x+
# -------------------------------------------------------------------------

if [ $(id -u) -ne 0 ]; then
	echo "Installer must be run as root."
	echo "Try 'sudo bash $0'"
	exit 1
fi

clear
echo "Check Raspi is shutdown properly"
echo "Installing shutdowncheck in /etc/systemd"
cp shutdowncheck.service /etc/systemd/system/powercheck.service
cp shutdowncheck /bin/shutdowncheck

echo "Enable Service"
systemctl enable shutdowncheck