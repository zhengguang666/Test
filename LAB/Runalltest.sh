#!/bin/sh

LOG_DIR=$PWD/log
echo "[ Start to run all stress and stability test ]"

mkdir -p $LOG_DIR
#
#
./otg.sh

echo "Run CPU & Memory stress test!"
cd  Burn
./Burn.sh
cd ../


echo "[ Start to test IO ]"
#
# usb 
#
function usb_loop()
{
	cd usb
	./AutoRun_usb_host.sh  >> $LOG_DIR/usb.log
	cd ../
}

echo "Start to loop USB"
while true
do
	usb_loop   ## usb loop; 
	sleep 1
done & 
#
# RS232
#
echo "Start to loop RS232"
while true
do
./Loop_uart232 /dev/ttyS4  >>  $LOG_DIR/rs232.log &
	sleep 1
done &

#Ethernet
#
echo  "Configure the Ethernet"
ifconfig eth0 192.168.1.199 netmask 255.255.254.0 up
#ifconfig enp1s0 172.21.170.199 netmask 255.255.254.0 up

ping 192.168.1.200  & 

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
./sd.sh  >>  $LOG_DIR/sd.log &
cd ../

#
# display.
#
#echo "Start to display video"
#cd display
#./display.sh  &
#cd ../