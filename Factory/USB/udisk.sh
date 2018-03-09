#!/bin/sh

disklist=`cat /proc/partitions | grep [sh]d.$ | awk '{print $4}'`
array=($disklist)
length=${#array[@]}
result=0
if [ "$length" == "0" ];then
  echo "There's no udisk insert"
  exit 1
fi
result=0
for n in $disklist; do
      result=0
      echo "$n Test"
      dd if=/dev/urandom of=/mnt/hdd_data bs=1024 count=5120;sync
      dd if=/mnt/hdd_data of=/run/media/{$n}1 bs=1024 count=5120;sync
      dd if=/run/media/{$n}1 of=/mnt/hdd_data1 bs=1024 count=5120;sync
      md5src=`md5sum /mnt/hdd_data`
      md5src=`echo ${md5src:0:32}`
	echo $md5src
      md5des=`md5sum /mnt/hdd_data1`
      md5des=`echo ${md5des:0:32}`
	echo $md5des
      if [ "$md5src" != "$md5des" ]; then
         echo "$n: Test FAIL!"
         result=1
         exit 1
      else
         echo "$n: Test PASS!"
      fi
done
      
