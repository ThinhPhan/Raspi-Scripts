#!/bin/bash
#
# Usage:       sh show_cpu_temp
#
# Monitors CPU clock speed and temperature.
# 

CPU_FREQ=/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
CPU_TEMP=/sys/class/thermal/thermal_zone0/temp
TEMP_UNIT=$'\xc2\xb0'C

echo CPU Info
CPU_INFO=$(lscpu)
echo $CPU_INFO
echo ---------------------
if [ -e $CPU_FREQ ] ; then
  if [ -e $CPU_FREQ ] ; then
    while [ true ] ; do
      clk=$(cat $CPU_FREQ)
      cpu=$(cat $CPU_TEMP)
      echo -ne "CPU Speed" $(($clk/1000)) "Mhz /" $(($cpu/1000)) $TEMP_UNIT "\r" 
      sleep 1
    done
  fi
fi