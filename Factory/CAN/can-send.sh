#!/bin/bash
#Program
#this program is used to send data test,aimed to test can device;
#2016/12/20 sen.wang version 1.0
canconfig can0 stop
canconfig can0 bitrate 1000000
canconfig can0 start
cansend can0 0x11 0x22 0x33 0x44 0x55 0x66 0x77
echo "can0 send data success"
