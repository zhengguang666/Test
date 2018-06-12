#!/bin/sh

check_net_connect ()
{
    if [ "$1" == "1" ]; then
        if [ "$2" == "1" ]; then
            ifconfig eth0 192.168.1.199 netmask 255.255.255.0 up
            while true
            do
                ping -I eth0 -c 3 192.168.1.200  > /dev/zero 2>&1
                if [ "$?" == "0" ]; then
                    echo "Network connection success"
                    break
                else
                    echo "Network connection failure"
                    read -p "Retry or not? (Y/N Default:Y) : " RetryFlag
                    if [ "${RetryFlag}" == "Y" ] || [ "${RetryFlag}" == "y" ] || [ "${RetryFlag}" == "" ];then
                        continue
                    else
                        break
                    fi
                fi
            done
        elif [ "$2" == "2" ]; then
            ifconfig eth0 192.168.1.199 netmask 255.255.255.0 up
            ifconfig eth1 192.168.2.199 netmask 255.255.255.0 up
            while true
            do
                ping -I eth0 -c 3 192.168.1.200  > /dev/zero 2>&1
                if [ "$?" == "0" ]; then
                    echo "eth0 connection success"
                    break
                else
                    echo "Network connection failure"
                    read -p "Retry or not? (Y/N Default:Y) : " RetryFlag
                    if [ "${RetryFlag}" == "Y" ] || [ "${RetryFlag}" == "y" ] || [ "${RetryFlag}" == "" ];then
                        continue
                    else
                        break
                    fi
                fi
            done
            while true
            do
                ping -I eth1 -c 3 192.168.2.200  > /dev/zero 2>&1
                if [ "$?" == "0" ]; then
                    echo "eth1 connection success"
                    break
                else
                    echo "Network connection failure"
                    read -p "Retry or not? (Y/N Default:Y) : " RetryFlag
                    if [ "${RetryFlag}" == "Y" ] || [ "${RetryFlag}" == "y" ] || [ "${RetryFlag}" == "" ];then
                        continue
                    else
                        break
                    fi
                fi
            done
        else
            echo "Not support more than two network interfaces"
        fi
        
    elif [ "$1" == "2" ]; then
        if [ "$2" == "1" ]; then
            if [ "$3" == "1" ]; then
                ifconfig eth0 192.168.1.200 netmask 255.255.255.0 up            
            else
                ifconfig eth0 192.168.1.199 netmask 255.255.255.0 up
                while true
                do
                    ping -I eth0 -c 3 192.168.1.200  > /dev/zero 2>&1
                    if [ "$?" == "0" ]; then
                        echo "eth1 connection success"
                        break
                    else
                        echo "Network connection failure"
                        read -p "Retry or not? (Y/N Default:Y) : " RetryFlag
                        if [ "${RetryFlag}" == "Y" ] || [ "${RetryFlag}" == "y" ] || [ "${RetryFlag}" == "" ];then
                            continue
                        else
                            break
                        fi
                    fi
                done 
            fi
        elif [ "$2" == "2" ]; then
            if [ "$3" == "1" ]; then
                ifconfig eth0 192.168.1.200 netmask 255.255.255.0 up    
                ifconfig eth1 192.168.2.199 netmask 255.255.255.0 up
                while true
                do
                    ping -I eth1 -c 3 192.168.2.200  > /dev/zero 2>&1
                    if [ "$?" == "0" ]; then
                        echo "eth1 connection success"
                        break
                    else
                        echo "Network connection failure"
                        read -p "Retry or not? (Y/N Default:Y) : " RetryFlag
                        if [ "${RetryFlag}" == "Y" ] || [ "${RetryFlag}" == "y" ] || [ "${RetryFlag}" == "" ];then
                            continue
                        else
                            break
                        fi
                    fi
                done 
            else
                ifconfig eth0 192.168.1.199 netmask 255.255.255.0 up    
                ifconfig eth1 192.168.2.200 netmask 255.255.255.0 up
                while true
                do
                    ping -I eth0 -c 3 192.168.1.200  > /dev/zero 2>&1
                    if [ "$?" == "0" ]; then
                        echo "eth0 connection success"
                        break
                    else
                        echo "Network connection failure"
                        read -p "Retry or not? (Y/N Default:Y) : " RetryFlag
                        if [ "${RetryFlag}" == "Y" ] || [ "${RetryFlag}" == "y" ] || [ "${RetryFlag}" == "" ];then
                            continue
                        else
                            break
                        fi
                    fi
                done 
            fi
            
        fi
    else
        echo "Invalid parameter"
        exit
    fi
}

while true
do
read -p "Will you test CPU loading and Memory? (Y/N Default:Y) : " CPULoadingFlag
if [ "${CPULoadingFlag}" == "Y" ] || [ "${CPULoadingFlag}" == "y" ] || [ "${CPULoadingFlag}" == "" ];then
    echo "You select Y"
else
    echo "You select N"
fi

read -p "Will you test USB? (Y/N Default:Y) : " USBFlag
if [ "${USBFlag}" == "Y" ] || [ "${USBFlag}" == "y" ] || [ "${USBFlag}" == "" ];then
    echo "You select Y"
    echo "Please insert U disk"
else
    echo "You select N"
fi

read -p "Will you test SD? (Y/N Default:Y) : " SDFlag
if [ "${SDFlag}" == "Y" ] || [ "${SDFlag}" == "y" ] || [ "${SDFlag}" == "" ];then
    echo "You select Y"
    echo "Please insert SD card"
else
    echo "You select N"
fi

read -p "Will you test serial port? (Y/N Default:Y) : " UARTFlag
if [ "${UARTFlag}" == "Y" ] || [ "${UARTFlag}" == "y" ] || [ "${UARTFlag}" == "" ];then
    echo "You select Y"
    echo "Please plug in loopback"
else
    echo "You select N"
fi

read -p "Will you test Play video? (Y/N Default:Y) : " VideoFlag
if [ "${VideoFlag}" == "Y" ] || [ "${VideoFlag}" == "y" ] || [ "${VideoFlag}" == "" ];then
    echo "You select Y"
else
    echo "You select N"
fi

read -p "Will you test Play music? (Y/N Default:Y) : " AudioFlag
if [ "${AudioFlag}" == "Y" ] || [ "${AudioFlag}" == "y" ] || [ "${AudioFlag}" == "" ];then
    echo "You select Y"
else
    echo "You select N"
fi

read -p "Will you test OTG? (Y/N Default:Y) : " OTGFlag
if [ "${OTGFlag}" == "Y" ] || [ "${OTGFlag}" == "y" ] || [ "${OTGFlag}" == "" ];then
    echo "You select Y"
else
    echo "You select N"
fi

read -p "Will you test GPIO? (Y/N Default:Y) : " GPIOFlag
if [ "${GPIOFlag}" == "Y" ] || [ "${GPIOFlag}" == "y" ] || [ "${GPIOFlag}" == "" ];then
    echo "You select Y"
else
    echo "You select N"
fi

read -p "Will you test Ethernet? (Y/N Default:Y) : " NetFlag
if [ "${NetFlag}" == "Y" ] || [ "${NetFlag}" == "y" ] || [ "${NetFlag}" == "" ];then
    echo "You select Y"
    check_net_connect $1 $2 $3
else
    echo "You select N"
fi

echo -e "\n===================================================="
echo "All you will test as follows:"
echo "===================================================="
if [ "${CPULoadingFlag}" == "Y" ] || [ "${CPULoadingFlag}" == "y" ] || [ "${CPULoadingFlag}" == "" ];then
    echo "CPU Loading/Memory"
fi

if [ "${USBFlag}" == "Y" ] || [ "${USBFlag}" == "y" ] || [ "${USBFlag}" == "" ];then
    echo "USB"
fi

if [ "${SDFlag}" == "Y" ] || [ "${SDFlag}" == "y" ] || [ "${SDFlag}" == "" ];then
    echo "SD"
fi

if [ "${UARTFlag}" == "Y" ] || [ "${UARTFlag}" == "y" ] || [ "${UARTFlag}" == "" ];then
    echo "serial port(UART)"
fi

if [ "${VideoFlag}" == "Y" ] || [ "${VideoFlag}" == "y" ] || [ "${VideoFlag}" == "" ];then
    echo "Video(play video)"
fi

if [ "${AudioFlag}" == "Y" ] || [ "${AudioFlag}" == "y" ] || [ "${AudioFlag}" == "" ];then
    echo "Audio(play music)"
fi

if [ "${OTGFlag}" == "Y" ] || [ "${OTGFlag}" == "y" ] || [ "${OTGFlag}" == "" ];then
    echo "OTG"
fi

if [ "${GPIOFlag}" == "Y" ] || [ "${GPIOFlag}" == "y" ] || [ "${GPIOFlag}" == "" ];then
    echo "GPIO"
fi

if [ "${NetFlag}" == "Y" ] || [ "${NetFlag}" == "y" ] || [ "${NetFlag}" == "" ];then
    echo "Ethernet"
fi

echo -e "\n===================================================="
read -p "Do you need to reselect (Y/N Default:N) : " ReselectFlag
echo -e "\n====================================================\n"
if [ "${ReselectFlag}" == "Y" ] || [ "${ReselectFlag}" == "y" ];then
    continue
else
    break
fi
done

LOG_DIR=$PWD/log
echo "[ Start to run all stress and stability test ]"

mkdir -p $LOG_DIR
#
#
net_test ()
{
   if [ "$1" == "1" ]; then
        if [ "$2" == "1" ]; then
            ping -I eth0 192.168.1.200  &
        elif [ "$2" == "2" ]; then
            ping -I eth0 192.168.1.200  &
            ping -I eth1 192.168.2.200  &
        fi       
    elif [ "$1" == "2" ]; then
        if [ "$2" == "1" ]; then
            if [ "$3" != "1" ]; then
                ping -I eth0 192.168.1.200  &         
            fi
        elif [ "$2" == "2" ]; then
            if [ "$3" == "1" ]; then
                ping -I eth1 192.168.2.200  &    
            else
                ping -I eth0 192.168.1.200  &  
            fi
            
        fi
    fi
}

if [ "${NetFlag}" == "Y" ] || [ "${NetFlag}" == "y" ] || [ "${NetFlag}" == "" ];then
    echo "Ethernet test"
    net_test $1 $2 $3
fi

if [ "${OTGFlag}" == "Y" ] || [ "${OTGFlag}" == "y" ] || [ "${OTGFlag}" == "" ];then
    echo "OTG test"
    ./otg.sh
fi

if [ "${CPULoadingFlag}" == "Y" ] || [ "${CPULoadingFlag}" == "y" ] || [ "${CPULoadingFlag}" == "" ];then
    cd  Burn
    ./Burn.sh
    cd ../
fi

if [ "${USBFlag}" == "Y" ] || [ "${USBFlag}" == "y" ] || [ "${USBFlag}" == "" ];then
    echo "USB test"
    cd usb
    while true
    do
        ./udisk.sh >> $LOG_DIR/usb.log   ## usb loop; 
        sync
        sleep 1
    done & 
    cd ../
fi

if [ "${SDFlag}" == "Y" ] || [ "${SDFlag}" == "y" ] || [ "${SDFlag}" == "" ];then
    echo "SD test"
    cd SD
    while true
    do
        ./sd.sh  >>  $LOG_DIR/sd.log &
    sync
    sleep 1
    done &
    cd ../
fi

if [ "${UARTFlag}" == "Y" ] || [ "${UARTFlag}" == "y" ] || [ "${UARTFlag}" == "" ];then
    echo "UART test"
    while true
    do
        ./Loop_uart232 /dev/ttyS4  >>  $LOG_DIR/rs232.log &
        sync
	sleep 1
    done &
fi

if [ "${VideoFlag}" == "Y" ] || [ "${VideoFlag}" == "y" ] || [ "${VideoFlag}" == "" ];then
    echo "Start to display video"
    cd display
        ./display.sh  &
    cd ../
fi

if [ "${AudioFlag}" == "Y" ] || [ "${AudioFlag}" == "y" ] || [ "${AudioFlag}" == "" ];then
    echo "Start to play music"
    cd audio
        ./audio.sh &
    cd ../
fi

if [ "${GPIOFlag}" == "Y" ] || [ "${GPIOFlag}" == "y" ] || [ "${GPIOFlag}" == "" ];then
    echo "Start to test gpio"
    cd gpio
        ./gpio_export.sh
        ./gpio_test.sh  &
    cd ../
fi



#
# can.
#
#cd CAN
#while true
#do
#./can-send.sh   ## usb loop; 
#	sleep 1
#done & 
#cd ../


