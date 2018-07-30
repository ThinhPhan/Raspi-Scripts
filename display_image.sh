#!/bin/bash
# Show image by using `fbi`

fbi -d /dev/fb0 -noverbose -nocomments -readahead -blend 2 -t 3 -u /home/pi/Downloads/images/*.*
