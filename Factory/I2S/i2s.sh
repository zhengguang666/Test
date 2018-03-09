#!/bin/bash
#Program

ls ./rec.wav  > /dev/zero 2>&1
if [ $? -eq 0 ]; then
rm ./rec.wav
sync
fi

amixer sset 'Right PGA Mixer Line1R' off  > /dev/zero 2>&1
amixer sset 'Left PGA Mixer Line1L' off  > /dev/zero 2>&1
amixer sset 'Right PGA Mixer Mic3R' on  > /dev/zero 2>&1
amixer cset name='PGA Capture Switch' on  > /dev/zero 2>&1
amixer cset name='PGA Capture Volume' 119  > /dev/zero 2>&1
amixer cset -c 0 name='PCM Playback Volume' 127  > /dev/zero 2>&1

seconds_left=5  
echo -n "Start to record sound after 5s: ${seconds_left}s"
while [ $seconds_left -gt 0 ];do  
  sleep 1  
  seconds_left=$(($seconds_left - 1))  
  echo -ne "\r                               \r"
  echo -n "Start to record sound after 5s: ${seconds_left}s"
done 

echo -e "\nStart to record sound:"
arecord -t wav -f S16_LE -r 44100 -d 5 rec.wav  > /dev/zero 2>&1

seconds_left=3
echo -n "Start to play sound after 3s: ${seconds_left}s"
while [ $seconds_left -gt 0 ];do
  sleep 1
  seconds_left=$(($seconds_left - 1))
  echo -ne "\r                               \r"
  echo -ne "Start to play sound after 3s: ${seconds_left}s"
done

echo -e "\nStart to play sound:"
aplay rec.wav  > /dev/zero 2>&1

