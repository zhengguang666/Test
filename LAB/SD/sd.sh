#!/bin/sh

ROOTDRIVE=`mount | grep 'on / ' | awk {'print $1'} |  cut -c6-12`
PARTITION_TEST=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<mmcblk.\>' | grep -n ''`
if [ "$PARTITION_TEST" = "" ]; then
    echo -e "No SD found\n"
    exit 1
fi
sdlist=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<mmcblk.\>' | grep -n '' | awk '{print $5}'`

for sd in ${sdlist[@]}
do 
    echo "${sd} Test"
    partlist=`mount | grep ${sd} | awk '{print $3}'`
    if [ "$partlist" = "" ]; then
       echo -e "No Partition found\n"
       continue
    fi

    for part in ${partlist[@]}
    do
        dd if=/dev/urandom of=/mnt/sd_origin_data bs=1024 count=256
        dd if=/mnt/sd_origin_data of=${part}/sd_data bs=1024 count=256
        dd if=${part}/sd_data of=/mnt/sd_copy_data bs=1024 count=256
      
        md5src=`md5sum /mnt/sd_origin_data`
        md5src=`echo ${md5src:0:32}`
        md5des=`md5sum /mnt/sd_copy_data`
        md5des=`echo ${md5des:0:32}`

        if [ "$md5src" != "$md5des" ]; then
            echo "${part}: Test Fail!"
        else
            echo "${part}: Test PASS"
        fi  
    done
done

