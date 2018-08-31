#!/bin/bash

# Print out the screen resolution
# 
# -------------------------------------------------------------------------
# TODO: Check `xdpyintro` app existed

xdpyinfo | grep "dimensions" | awk '{ print $2 }'
# OR
#xrandr | grep '*' | awk '{ print $1 }'
