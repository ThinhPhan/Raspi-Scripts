#!/bin/bash

# -------------------------------------------------------------------------
# Update Firmware
# Certain files from the `master` branch of the `rpi-firmware` repository.
# -------------------------------------------------------------------------

# Raspian
sudo apt-get install rpi-update

# Other OSes
sudo curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update && sudo chmod +x /usr/bin/rpi-update

# Updating
sudo rpi-update