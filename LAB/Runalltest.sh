#!/bin/sh

LOG_DIR=$PWD/log
echo "[ Start to run all stress and stability test ]"

mkdir -p $LOG_DIR
#
#

read -p "Select board number (1/2) : " num 
if [ "$num" == "1" ];then
echo "You select 1"
ifconfig eth0 192.168.1.199 netmask 255.255.254.0 up
elif [ "$num" == "2" ];then
echo "You select 2"
ifconfig eth0 192.168.1.200 netmask 255.255.254.0 up
else
exit
fi
seconds_left=10 
echo -n "Start to test after 10s: ${seconds_left}s"
while [ $seconds_left -gt 0 ];do  
  sleep 1  
  seconds_left=$(($seconds_left - 1))  
  echo -ne "\r                               \r"
  echo -n "Start to test after 10s: ${seconds_left}s"
done 

echo  "Configure the Ethernet"
if [ "$num" == "1" ];then
ping 192.168.1.200 &
elif [ "$num" == "2" ];then
ping 192.168.1.199 &
fi

./otg.sh

echo "Run CPU & Memory stress test!"
cd  Burn
./Burn.sh
cd ../


echo "[ Start to test IO ]"
#
# usb 
#

echo "Start to loop USB"
cd usb
while true
do
	./udisk.sh >> $LOG_DIR/usb.log   ## usb loop; 
	sync
        sleep 1
done & 
cd ../
#
# RS232
#
echo "Start to loop RS232"
while true
do
./Loop_uart232 /dev/ttyS4  >>  $LOG_DIR/rs232.log &
sync
	sleep 1
done &

#Ethernet
#
#echo  "Configure the Ethernet"
#if [ "$num" == "1" ];then
#ping 192.168.1.200 &
#fi

#
# gpio
#
#echo "Start to test gpio"
#cd gpio
#./gpio_export.sh
#./gpio_test.sh  &
#cd ../

#
# audio.
#
#cd audio
#./audio.sh &
#cd ../

#
# can.
#
#cd CAN
#while true
#do
#./can-send.sh   ## usb loop; 
#	sleep 1
#done & 
#cd ../

#
#SD
#
echo "sd test"
cd SD
while true
do
./sd.sh  >>  $LOG_DIR/sd.log &
sync
sleep 1
done &
cd ../

#
# display.
#
#echo "Start to display video"
#cd display
#./display.sh  &
#cd ../