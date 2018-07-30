#!/bin/sh

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ];then
    printf "My IP addres is %s\n" "$_IP"
fi 
