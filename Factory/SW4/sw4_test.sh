#!/bin/bash
#Program

cd /sys/class/gpio

ls gpio57 > /dev/zero 2>&1
if [ $? -eq 0 ]; then
  echo "SW4 test Start"
else
  echo 57 > export
  echo "SW4 test Start"
fi

old_value=`cat gpio57/value`
	
while true
do
tmp=`cat gpio57/value`
if [ $tmp -ne $old_value ]; then
  old_value=$tmp
  if [ $tmp -eq 0 ]; then
    echo "SW4 is Pressed"
  else
    echo "SW4 is Released"
  fi
fi
done