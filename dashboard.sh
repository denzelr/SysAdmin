#!/bin/bash
CPULA=$(uptime | awk '{print $9, $10, $11}')
RAM=$(free -m | grep 'Mem:*' | awk '{print $4}')
loREC=$(cat /proc/net/dev | grep 'lo:*' | awk '{print $2}')
loTRANS=$(cat /proc/net/dev | grep 'lo:*' | awk '{print $10}')
enpREC=$(cat /proc/net/dev | grep 'enp0s3:*' | awk '{print $2}')
enpTRANS=$(cat /proc/net/dev | grep 'enp0s3:*' | awk '{print $10}')
INTERNET=$(ping -q -w1 -c1 google.com)
if [ $? == 0 ]; then
   CONNECTED="YES"
else
   CONNECTED="NO"
fi
USERS=$(cat /etc/passwd | awk '{number+=1} END{print number}')
ACTIVE=$(uptime | awk '{print $4}')
SHELL=$(cat /etc/passwd | cut -d: -f7 | uniq -c | tail -n1 | awk '{print $2}')
echo "CPU AND MEMORY RESOURCES----------------"
echo "CPU Load Average: $CPULA   Free RAM: $RAM MB"
echo ""
echo "NETWORK CONNECTIONS---------------------"
echo "lo bytes Received: $loREC        bytes Transmitted: $loTRANS"
echo "enp0s3 bytes Received: $enpREC   bytes Transmitted: $enpTRANS"
echo "Internet Connectivity: $CONNECTED"
echo ""
echo "ACCOUNT INFORMATION---------------------"
echo "Total Users: $USERS  Number Active: $ACTIVE"
echo "Most Frequently Used Shell: $SHELL"
