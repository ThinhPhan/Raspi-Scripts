#!/bin/sh

echo "Prepare shutdown at $(date)"
echo "Shutdown at $(date)" >> /var/log/shutdown.log
sudo shutdown -H now