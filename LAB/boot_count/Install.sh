#!/bin/sh

echo "Start to install boot count scripts"
mkdir -p /mnt
cp S8800.sh   /mnt
cp bootcount.service  /etc/systemd/system
echo "Installation Done. "

echo "Enable this service ..."
cd  /etc/systemd/system
systemctl  enable  bootcount.service
sync
echo "Install sucessfully."

exit 0;






