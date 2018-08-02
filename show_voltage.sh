#!/bin/bash

# Script: show_voltage.sh
# Purpose: Show current core voltages.
# Author: Vincent Phan <vincent.phan@firstidea.vn> under GPL v2.x+
# -------------------------------------------------------

coreVoltage=$(vcgencmd measure_volts core)
coreVoltage=${coreVoltage#"volt="}
coreVoltage=${coreVoltage%"V"}
echo $coreVoltage