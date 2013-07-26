#!/bin/sh 
#add here some commands which will be executed on first startup 
echo "remove install link `date`" >> /var/log/install.script.log 
rm /etc/rc2.d/S99install.sh >> /var/log/install.script.log 

echo "Upgrading the Kernel"
/sbin/init 6
