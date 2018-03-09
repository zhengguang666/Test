#!/bin/sh

#----------------------------------------
#   the shell is for RSB 4220
#   RTC test
#   -----  2014/09/18 ------
#  
#Test target:
#          RTC
#Usage: #./AutoRun_rtc.sh
#
#-----------------------------------------

old_year=`date +"%Y"`;
next_year=$((old_year+1));
#write system time into RTC time;
hwclock -w 1>/dev/null 2>/dev/null & 
ps | grep " hwclock ";
date  01010101$next_year
#write old time to system time
hwclock -s 1>/dev/null 2>/dev/null

cmp_year=`date +"%Y"`;
if [ "$cmp_year" != "$next_year" ];then
    echo "+------------------+"
    echo "| [RTC] Test Pass! |"
    echo "+------------------+"
else
    echo "+------------------+"
    echo "| [RTC] Test Fail! |"
    echo "+------------------+"
fi
