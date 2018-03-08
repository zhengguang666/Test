#!/bin/bash
#Program

/etc/init.d/weston restart
sleep 1
/etc/init.d/matrix-gui-2.0 start

