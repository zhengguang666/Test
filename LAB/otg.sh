#!/bin/bash
#Program

mkdir /mnt/ramdrive
mount -t tmpfs tmpfs /mnt/ramdrive -o size=20M
dd if=/dev/zero of=/mnt/ramdrive/vfat-file bs=1M count=20
mkfs.vfat /mnt/ramdrive/vfat-file
modprobe g_mass_storage file=/mnt/ramdrive/vfat-file
