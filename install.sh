#!/bin/bash

# 

check_device()
{
	# check, if sudo is used
	echo " Checking access permissions..."
	if [ "$(sudo id -u)" != "0" ]; then
		echo "Script must be run under sudo from the user you want to install for. Try 'sudo $0'"
    	exit 1
	fi
}

check_dependency()
{
	echo "Updating system package database..."
	apt-get -qq update > /dev/null

	echo "Upgrading the system..."
	echo "(This might take a while.)"
	apt-get -y -qq upgrade > /dev/null

	echo "Installing dependencies..."
	sudo apt-get -y -qq install \
		git-core python-pip python-netifaces python-simplejson python-imaging \
		python-dev uzbl sqlite3 x11-xserver-utils libx11-dev \
		watchdog chkconfig feh > /dev/null

	# ensure that all needed OS packages are installed
	apt-get install -y git cmake g++-4.9 doxygen || (c=$?; echo "Error during installation of APT packages"; (exit $c))
}

setup_os()
{
	echo "Increasing swap space to 500MB..."
	echo "CONF_SWAPSIZE=500" > "$HOME/dphys-swapfile"
	sudo cp /etc/dphys-swapfile /etc/dphys-swapfile.bak
	sudo mv "$HOME/dphys-swapfile" /etc/dphys-swapfile

	echo "Enabling Watchdog..."
	sudo modprobe bcm2708_wdog > /dev/null
	sudo cp /etc/modules /etc/modules.bak
	sudo sed '$ i\bcm2708_wdog' -i /etc/modules
	sudo chkconfig watchdog on
	sudo cp /etc/watchdog.conf /etc/watchdog.conf.bak
	sudo sed -e 's/#watchdog-device/watchdog-device/g' -i /etc/watchdog.conf
	sudo /etc/init.d/watchdog start

	echo "Adding MyPi to autostart (via Supervisord)"
	sudo ln -s "$HOME/mypi/misc/supervisor" /etc/init.d/supervisor
	sudo ln -s "$HOME/mypi/misc/supervisord.conf" /etc/supervisor/supervisord.conf
	sudo ln -s "$HOME/mypi/misc/supervisord.conf" /etc/supervisord.conf
	sudo ln -s "$HOME/mypi/misc/supervisor_screenly.conf" /etc/supervisor/conf.d/screenly.conf
	sudo update-rc.d supervisor defaults
	sudo /etc/init.d/supervisor start > /dev/null

	echo "Quiet the boot process..."
	sudo cp /boot/cmdline.txt /boot/cmdline.txt.bak
	sudo sed 's/$/ quiet/' -i /boot/cmdline.txt

}

setup_service()
{
	# The best way is get from list & install each app
	# enable as a service & checking.
	mkdir -p "$HOME/.mypi"
	cp "$HOME/mypi/misc/mypi.conf" "$HOME/.mypi/"

	# Use systemd
	systemctl enable shutdown_pi.service
	systemctl start shutdown_pi.service

	echo "Disbale shutdown script"
	echo "systemctl disable shutdown_pi.service"
}

check_final()
{
	# check that the service is running
	isServiceRunning=$(service X status | grep running | wc -l)
	if [[ $isServiceRunning -eq 1 ]]; then
		echo "[SUCCESS] The X service is running"
	else
		echo "[ERROR] The X service is not running"
	fi 

	echo "You can find the configuration file at /etc/x-config.cfg".
}

check_device
check_dependency
setup_os
download_dependency
install_dependecy
install_service
setup_service
check_final

# Video enhance
enhance()
{
	# Make sure we have proper framebuffer depth.
	if grep -q framebuffer_depth /boot/config.txt; then
	sudo sed 's/^framebuffer_depth.*/framebuffer_depth=32/' -i /boot/config.txt
	else
	echo 'framebuffer_depth=32' | sudo tee -a /boot/config.txt > /dev/null
	fi

	# Fix frame buffer bug
	if grep -q framebuffer_ignore_alpha /boot/config.txt; then
	sudo sed 's/^framebuffer_ignore_alpha.*/framebuffer_ignore_alpha=1/' -i /boot/config.txt
	else
	echo 'framebuffer_ignore_alpha=1' | sudo tee -a /boot/config.txt > /dev/null
	fi
}

sudo nano /etc/rc.local
sudo python /share/shutdown_pi.py &

echo ""
echo "Installation successful. Ready to rock!"