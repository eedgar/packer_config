#!/bin/bash
if [ -f /home/vagrant/VBoxGuest*.iso ]
then
    cd /tmp
    mkdir -p /mnt/vbox
    mount -o loop,ro /home/vagrant/VBoxGuest*.iso /mnt/vbox
    cd /mnt/vbox

    sh ./VBoxLinuxAdditions.run
    cd /tmp 

    umount /mnt/vbox
    rmdir /mnt/vbox
    cd /

    rm -rf /home/vagrant/VBoxGuest*.iso
fi
