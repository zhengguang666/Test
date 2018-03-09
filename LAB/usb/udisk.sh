#!/bin/sh

disklist=`cat /proc/partitions | grep [sh]d.$ | grep -n '' | awk '{print $5}'`
if [ "$disklist" = "" ]; then
    echo -e "No USB or SATA found\n"
    exit 1
fi

for disk in $disklist; do
      echo "${disk} Test"
      partlist=`mount | grep ${disk} | awk '{print $3}'`
      if [ "$partlist" = "" ]; then
         echo -e "No Partition found\n"
         continue
      fi

      for part in ${partlist[@]}
      do
          dd if=/dev/urandom of=/mnt/disk_origin_data bs=1024 count=256
          dd if=/mnt/disk_origin_data of=${part}/disk_data bs=1024 count=256
          dd if=${part}/disk_data of=/mnt/disk_copy_data bs=1024 count=256

          md5src=`md5sum /mnt/disk_origin_data`
          md5src=`echo ${md5src:0:32}`
          md5des=`md5sum /mnt/disk_copy_data`
          md5des=`echo ${md5des:0:32}`
          if [ "$md5src" != "$md5des" ]; then
            echo "${part}: Test Fail!"
          else
            echo "${part}: Test PASS"
          fi
      done
done

