#!/bin/bash
#Program

pcie_count=0
ifconfig enp1s0 down
ifconfig enP1p1s0 down

ifconfig -a | grep enp1s0  > /dev/zero 2>&1
if [ $? -eq 0 ];then
  pcie_count=$(($pcie_count + 1))
  echo "Star to test the enp1s0 network card:"
  read -p "Please set the enp1s0 network card IP: " IP
  read -p "Please set the enp1s0 network card netmask: " netmask
  read -p "Please set the enp1s0 network card gateway: " gateway
  ifconfig enp1s0 $IP netmask $netmask up 
  route add default gw $gateway

  ping -I enp1s0 -c 3 www.baidu.com > /dev/zero 2>&1

  if [ $? -eq 0 ];then
    echo "enp1s0 network card test PASS"
  else
    echo "enp1s0 network card test FAIL"
  fi

  ifconfig enp1s0 down
fi

ifconfig -a | grep enP1p1s0 > /dev/zero 2>&1
if [ $? -eq 0 ];then
  pcie_count=$(($pcie_count + 1))
  echo "Star to test the enP1p1s0 network card:"
  read -p "Please set the enP1p1s0 network card IP: " IP
  read -p "Please set the enP1p1s0 network card netmask: " netmask
  read -p "Please set the enP1p1s0 network card gateway: " gateway
  ifconfig enP1p1s0 $IP netmask $netmask up
  route add default gw $gateway

  ping -I enP1p1s0 -c 3 www.baidu.com > /dev/zero 2>&1

  if [ $? -eq 0 ];then
    echo "enP1p1s0 network card test PASS"
  else
    echo "enP1p1s0 network card test FAIL"
  fi

  ifconfig enP1p1s0 down
fi

if [ $pcie_count == 0 ];then
  echo "Network card not Found "
  echo "Test over"
  exit 1
fi

echo "Test over"


