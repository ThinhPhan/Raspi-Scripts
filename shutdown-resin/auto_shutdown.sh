#!/bin/bash

echo "Prepare shutdown at $(date)"
echo "Shutdown at $(date)" >> /var/log/shutdown.log
sudo sbin/shutdown -H now