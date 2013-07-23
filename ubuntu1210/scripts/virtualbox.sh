cd /tmp
mkdir -p /mnt/vbox
if [ -f /home/vagrant/VBoxGuest*.iso ]
then

    mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/vbox
    sh /mnt/vbox/VBoxLinuxAdditions.run
    umount /mnt/vbox
    rmdir /mnt/vbox
    rm -rf /home/vagrant/VBoxGuest*.iso
fi
