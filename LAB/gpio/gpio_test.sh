#!/bin/bash
#Program

if [ "$1" == "-h" ];then
echo "
GPIO0 97
GPIO1 218
GPIO2 98
GPIO3 219
GPIO4 100
GPIO5 68
GPIO6 101
GPIO7 69"
echo "For example: ./gpio_test.sh 97"
exit 1
fi

cd /sys/class/gpio
echo "Please connect GPIO0 with GPIO5
GPIO1 with GPIO6
GPIO2 with GPIO7
GPIO3 with GPIO4
"
	
while true
do
#0--5
echo out > gpio97/direction
echo in > gpio68/direction
echo 1 > gpio97/value
cat gpio68/value
echo 0 > gpio97/value
cat gpio68/value

echo in > gpio97/direction
echo out > gpio68/direction
echo 1 > gpio68/value
cat gpio97/value
echo 0 > gpio68/value
cat gpio97/value

#1--6
echo out > gpio218/direction
echo in > gpio101/direction
echo 1 > gpio218/value
cat gpio101/value
echo 0 > gpio218/value
cat gpio101/value

echo in > gpio218/direction
echo out > gpio101/direction
echo 1 > gpio101/value
cat gpio218/value
echo 0 > gpio101/value
cat gpio218/value

#2--7
echo out > gpio98/direction
echo in > gpio69/direction
echo 1 > gpio98/value
cat gpio69/value
echo 0 > gpio98/value
cat gpio69/value

echo in > gpio98/direction
echo out > gpio69/direction
echo 1 > gpio69/value
cat gpio98/value
echo 0 > gpio69/value
cat gpio98/value

#3--4
echo out > gpio219/direction
echo in > gpio100/direction
echo 1 > gpio219/value
cat gpio100/value
echo 0 > gpio219/value
cat gpio100/value

echo in > gpio219/direction
echo out > gpio100/direction
echo 1 > gpio100/value
cat gpio219/value
echo 0 > gpio100/value
cat gpio219/value
done