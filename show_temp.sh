#!/bin/bash
# Script: show_temp.sh
# Purpose: Display the ARM CPU and GPU temperature of Raspberry Pi 2/3
# Author: Raspberry Pi Viet Nam (https://raspberrypi.vn) under GPL v2.x+
# -------------------------------------------------------

cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date) @ $(hostname)"
echo "-------------------------------------------"
echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
echo "CPU => $((cpu/1000))'C"