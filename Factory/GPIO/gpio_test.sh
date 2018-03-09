#!/bin/bash
#Program

cd /sys/class/gpio
echo "Please connect GPIO0 with GPIO4
GPIO1 with GPIO2
GPIO3 with GPIO5
GPIO6 with GPIO7
"
ls gpio68 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 68 > export
fi

ls gpio69 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 69 > export
fi

ls gpio97 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 97 > export
fi

ls gpio98 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 98 > export
fi

ls gpio100 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 100 > export
fi

ls gpio101 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 101 > export
fi

ls gpio218 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 218 > export
fi

ls gpio219 > /dev/zero 2>&1
if [ $? -ne 0 ];then
echo 219 > export
fi

#0--4
echo out > gpio97/direction
echo in > gpio100/direction
echo 1 > gpio97/value
cat gpio100/value
echo 0 > gpio97/value
cat gpio100/value

echo in > gpio97/direction
echo out > gpio100/direction
echo 1 > gpio100/value
cat gpio97/value
echo 0 > gpio100/value
cat gpio97/value

#1--2
echo out > gpio218/direction
echo in > gpio98/direction
echo 1 > gpio218/value
cat gpio98/value
echo 0 > gpio218/value
cat gpio98/value

echo in > gpio218/direction
echo out > gpio98/direction
echo 1 > gpio98/value
cat gpio218/value
echo 0 > gpio98/value
cat gpio218/value

#3--5
echo out > gpio219/direction
echo in > gpio68/direction
echo 1 > gpio219/value
cat gpio68/value
echo 0 > gpio219/value
cat gpio68/value

echo in > gpio219/direction
echo out > gpio68/direction
echo 1 > gpio68/value
cat gpio219/value
echo 0 > gpio68/value
cat gpio219/value

#6--7
echo out > gpio101/direction
echo in > gpio69/direction
echo 1 > gpio101/value
cat gpio69/value
echo 0 > gpio101/value
cat gpio69/value

echo in > gpio101/direction
echo out > gpio69/direction
echo 1 > gpio69/value
cat gpio101/value
echo 0 > gpio69/value
cat gpio101/value

