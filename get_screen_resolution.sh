#!/bin/bash
# Print out the screen resolution
# 
xdpyinfo | grep "dimensions" | awk '{ print $2 }'
# OR
#xrandr | grep '*' | awk '{ print $1 }'
