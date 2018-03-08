#!/bin/bash

#---------------------------------------------------------
#DESCRIPTION : Check the usb disks,format,creat and delete partation,then 
#                   copy file and compare .
#USAGE       : ./usb_test.sh 
#EXAMPLE     : ./usb_test.sh 
#HISTORY     : 2016/2/10  
#---------------------------------------------------------

_g_result=0
usb_mountpoint=

IO_test()
{
    cat /proc/cpuinfo > source_file
    cp source_file $1/dest_file
	sync;
    diff source_file $1/dest_file
    return $?
}


disk_to_test=`cat /proc/partitions | grep [sh]d.$ | awk '{print $4}'`

for device in $disk_to_test
do
	echo disk_to_test=$disk_to_test
	usb_mountpoint=/run/media/${device}1
	if [ "$device" = "" ];then
		_g_result=1
	else
		# create partition
		echo "---create partition for $device"
		fdisk /dev/$device < fdisk.dat-vfat 1>/dev/null 2>/dev/null
		### reload the parttiion table.
		if [ -x /usr/sbin/partprobe ]; then
		    /usr/sbin/partprobe ${DRIVE} > /dev/null 2>/dev/null
		else
		    sleep 1
		fi	
		
		# format file system
		echo "---format file system"
		umount /dev/${device}1  1> /dev/null 2> /dev/null
		mkfs.vfat -F 32 /dev/${device}1 1>/dev/null 2>/dev/null

		## read/write test
		echo "---read/write test"
		umount /dev/${device}1  1> /dev/null 2> /dev/null
		mkdir -p $usb_mountpoint
		mount /dev/${device}1 $usb_mountpoint	1>/dev/null 2>/dev/null
		result=`IO_test $usb_mountpoint`
		if [[ ${result} -ne 0 ]];then
			echo "Error : diff source_file and dest_file"
			_g_result=1
		fi
		umount $usb_mountpoint	1>/dev/null 2>/dev/null
		sleep 3
	fi	

	## print the test result!
	if [ ${_g_result} -eq 0 ]; then
		echo "====usb test pass ====="
	else
		echo "====usb test fail ====="
		exit 1
	fi
done 
exit 0
