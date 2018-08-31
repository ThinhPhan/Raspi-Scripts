# Lock updates when container starts
NOW=$(date)
UPTIME=$(uptime -p)
SINCE=$(uptime -s)
while sleep 10; do echo "Time: $NOW, Uptime: $UPTIME - since $SINCE"; done
