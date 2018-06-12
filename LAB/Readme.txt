1. system reboot count scripts
please into boot_count directory.
and excute Install scripts.
$ cd boot_count
$ ./Install.sh


2. excute LAB stability test

./Runalltest.sh

3.usb test only use dd command

4. Runalltest_S.sh

./Runalltest_S.sh 1 1  
one board/one network interface
PC set IP 192.168.1.200

./Runalltest_S.sh 1 2
one board/two network interfaces
one PC set IP 192.168.1.200
another PC set IP 192.168.2.200

./Runalltest_S.sh 2 1 1
./Runalltest_S.sh 2 1 2
two board/one network interfaces

./Runalltest_S.sh 2 2 1
./Runalltest_S.sh 2 2 2
two board/two network interfaces
eth0----eth0
eth1---eth1


