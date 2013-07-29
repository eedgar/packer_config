#!/bin/sh 
#add here some commands which will be executed on first startup 
echo "remove install link `date`" >> /var/log/install.script.log 
rm /etc/rc2.d/S99install.sh >> /var/log/install.script.log 

echo "Upgrading the Kernel"
#sudo apt-get update && sudo apt-get install linux-image-generic-lts-raring
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9-raring/linux-headers-3.9.0-030900-generic_3.9.0-030900.201304291257_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9-raring/linux-headers-3.9.0-030900_3.9.0-030900.201304291257_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9-raring/linux-image-3.9.0-030900-generic_3.9.0-030900.201304291257_amd64.deb
sudo dpkg -i *.deb
sudo update-grub
sync
sync
sync
#dpkg --configure -a
/sbin/init 6
