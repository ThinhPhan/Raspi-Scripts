#!/bin/bash
# Script to show a single image file.

PHOTO_FILE=$1
INTERVAL=30

sudo fbi -T 2 -m 1280x1024 -a -t $INTERVAL -u --blend 2 --cachemem 3 $PHOTO_FILE
