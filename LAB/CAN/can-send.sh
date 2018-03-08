#!/bin/bash
#Program
#this program is used to send data test,aimed to test can device;
#2016/12/20 sen.wang version 1.0
#while true
#do
cansend can0 0x11 0x22 0x33 0x44 0x55 0x66 0x77
echo "can0 send data success"
#done 
