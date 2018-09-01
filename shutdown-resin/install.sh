#!/bin/sh
# Script: auto-shutdown.sh
# Purpose: Install cronjob auto shutdown at the specific time
# Author: Vincent Phan <vincent.phan@firstidea.vn> under GPL v2.x+
# -------------------------------------------------------

sudo apt-get update && sudo apt-get install -y cron procmail && \
sudo apt-get clean && rm -rf /var/lib/apt/lists/*

cp auto_shutdown.sh /home/pi/

sudo crontab jobs.txt

#sh app.sh