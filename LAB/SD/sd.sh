#!/bin/bash
#Program

touch aaa.txt
sync
chmod 777 aaa.txt
sync
echo "1234567890" > aaa.txt
sync
while true
do
cp aaa.txt  /run/media/mmcblk0p1
sync
rm  /run/media/mmcblk0p1/aaa.txt
sync
done
