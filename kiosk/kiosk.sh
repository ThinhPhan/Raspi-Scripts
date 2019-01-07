#!/bin/bash

# -------------------------------------------------------------------------
# Date: 07.01.2019
# Version: 1.0
# Author: Vincent Phan
# The kiosk script will handle the bulk of the work for our Pi Kiosk:
# - Launching Chromium itself
# - 
# -------------------------------------------------------------------------

# Display Power Management System Configure
xset s noblank
xset s off
xset -dpms

# Hide mouse from the diplay while idle in 0.5s
unclutter -idle 0.5 -root &

# search through the Chromium preferences file and clear out any flags that would make the warning bar appear
# If Chromium ever crashes or is closed suddenly, the lines will ensure 
# you don’t have to get hold of a mouse and keyboard to clear the warning bar 
# that would typically appear at the top of the browser.
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences


/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk https://youtube.com &

# Simulate keyboard press
# while true; do
#       xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
#       sleep 15
# 	  xdotool keydown ctrl+r; xdotool keyup ctrl+r;
# done