#!/bin/bash
ls /etc/boottimes > /dev/zero 2>&1
if [ $? -eq 0 ]; then
   boots=`cat /etc/boottimes`
   boots=$[ boots+1 ]
else
   boots=1
fi
   echo "boots=$boots"
   echo "$boots" > /etc/boottimes
sync

