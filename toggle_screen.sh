#!/bin/sh
#
# Script to turn on display
#

# Set display so that script will effect screen on frame
export DISPLAY=:0

case "$1" in
    on)
        /usr/bin/xset s reset
        /usr/bin/xset s on
        /usr/bin/xset s 1
        echo "Turn on screen"
        ;;
    off)
        echo "Turn off screen"
        /usr/bin/xset s reset
        /usr/bin/xset s off
        ;;
esac

exit 0
