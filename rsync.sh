#!/bin/sh
# Syncs the photos on Rasp with the photo on host computer.
# Script to copy and remove photos on the DPF
# Script requires that a rsync server on a machine
# seperate from the DPF be running and configured
#

PATH=/sbin:/usr/sbin:/usr/bin:/usr/local/bin

EXTERNAL="EXTERNAL IP OF RSYNC SERVER"
INTERNAL="192.168.1.113"

# When rasp is inside your network and will connect via an intranet
rsync -v -rlt -z --chmod=a=rw,Da+x --delete --bwlimit=2048 $INTERNAL:/Pictures/easy-life/ /home/pi/Downloads/Images/

# When rasp is external to your network and must connect via the Internet
#rsync -azv --password-file=/home/pi/frame/.rsync.pwd --delete --bwlimit=2048 dpfl@$EXTERNAL::dpfl /home/pi/frame/photos/

exit 0
