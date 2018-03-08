#!/bin/bash
ls /mnt/boottimes > /dev/zero 2>&1
if [ $? -eq 0 ]; then
   boots=`cat /mnt/boottimes`
   boots=$[ boots+1 ]
else
   boots=1
fi
   echo "boots=$boots"
   echo "$boots" > /mnt/boottimes
sync

