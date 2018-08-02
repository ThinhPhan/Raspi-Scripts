#!/bin/bash

# Credit:
# Script to email when the IP address changes
# drware@thewares.net
# -------------------------------------------------------------------------

RECIPIENT="phanquocthinh@gmail.com"

if [ -f /tmp/ip.tmp ];
then
mv /tmp/ip.tmp /tmp/ip_old.tmp
fi

/sbin/ifconfig > /tmp/ip.tmp

if [ -f /tmp/ip_old.tmp ];
then
diff /tmp/ip.tmp /tmp/ip_old.tmp > /tmp/ip_diff.tmp
else
 > /tmp/ip_diff.tmp
fi

RUNNING=`cat /tmp/if_diff.tmp | wc -l`
NUM=10

if [ $NUM -lt $RUNNING ]
then
	cp /tmp/ip.tmp /tmp/ip_mail.tmp
	head -n 17 /tmp/ip_mail.tmp | tail -n 1 > /tmp/ip_mail2.tmp
	cat /tmp/ip_mail2.tmp | mailx -s "DPF IP Change: `date + %k%Mhrs-%Y%m%d`" $RECIPIENT
fi

exit 0
