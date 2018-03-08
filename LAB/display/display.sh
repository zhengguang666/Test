#!/bin/sh
#this shell is for LVDS

/etc/init.d/matrix-gui-2.0 stop
/etc/init.d/weston stop

echo "-------------Begin LVDS Test------------"
while true
do
gst-launch-1.0 playbin uri=file:///usr/share/ti/video/TearOfSteel-Short-1920x800.mov audio-sink="alsasink" video-sink="kmssink scale=true"  1>/dev/null 2>/dev/null
done
