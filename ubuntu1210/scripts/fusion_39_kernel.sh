#!/usr/bin/env bash
KVER=`uname -r`

if [ -f /home/vagrant/linux.iso ]
then
    cd /tmp
    mkdir -p /mnt/fusion

    mount -o ro,loop /home/vagrant/linux.iso /mnt/fusion
    tar zxf /mnt/fusion/VMwareTools-*.tar.gz -C /tmp/
    umount /mnt/fusion
    rmdir /mnt/fusion

    if [ ! -h "/lib/modules/$KVER/build/include/linux/version.h" ]; then
        echo "Linking version.h header for vmware tools."
        cd /lib/modules/$KVER/build/include/linux/
        ln -s ../generated/uapi/linux/version.h
        cd -
    fi

    apt-get -y install build-essential gcc build-essential linux-headers-$(uname -r) dkms make
    echo "Downloading vmware patches..."
    cd vmware-tools-distrib
    wget https://raw.github.com/ebdevrepo/bin/master/vmware9.k3.8rc4.patch
    wget https://raw.github.com/ebdevrepo/bin/master/vmware_vmci_fix.sh
    chmod +x ./vmware_vmci_fix.sh
    ./vmware_vmci_fix.sh
    wget https://raw.github.com/ebdevrepo/bin/master/vmware9.compat_mm.patch
    wget https://raw.github.com/eedgar/vmware_fedora_fixes_bin/master/vmware9.k3.9.patch
    wget https://raw.github.com/eedgar/vmware_fedora_fixes_bin/master/vmware_hgfs_fix.sh
    chmod +x ./vmware_hgfs_fix.sh
    ./vmware_hgfs_fix.sh
    cd -

    /tmp/vmware-tools-distrib/vmware-install.pl --clobber-kernel-modules=vmci -d

    rm -rf vmware-tools-distrib
    cd ~

    rm /home/vagrant/linux.iso
fi
