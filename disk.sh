#!/bin/bash
CAP=80
current=$(df -h | awk '{percent+=$5} END{print percent}')
if [ "$current" -ge "$CAP" ]; then
   MAILBODY="Capacity Warning: Disk Space has reached $current % capacity."
   echo "Capacity warning: Sending email to root..."
   echo ${MAILBODY} | mail -s "Disk Capacity Warning" root
elif [ "$current" -lt "$CAP" ]; then
   echo "Disk space is at $current %"
fi
