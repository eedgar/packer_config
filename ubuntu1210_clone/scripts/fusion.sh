cd /tmp
mkdir -p /mnt/cdrom
if [ -f /home/vagrant/linux.iso ]
then

    mount -o loop /home/vagrant/linux.iso /mnt/cdrom
    tar zxvf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
    apt-get install build-essential gcc build-essential linux-headers-$(uname -r) dkms
    /tmp/vmware-tools-distrib/vmware-install.pl -d
    umount /mnt/cdrom
    rm /home/vagrant/linux.iso
fi
