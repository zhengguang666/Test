#!/bin/bash
#Program
#this program is used to receive data test,aimed to test can device;
#2016/12/20 sen.wang version 1.0
canconfig can0 stop
canconfig can0 bitrate 1000000
canconfig can0 start
candump can0
echo "can0 ready to receive data"
