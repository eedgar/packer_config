#!/usr/bin/env bash
KVER=`uname -r`

if [ -f /home/vagrant/linux.iso ]
then
    cd /tmp
    mkdir -p /mnt/cdrom

    mount -o loop /home/vagrant/linux.iso /mnt/cdrom
    tar zxvf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
    umount /mnt/cdrom
    if [ ! -h "/lib/modules/$KVER/build/include/linux/version.h" ]; then
        echo "Linking version.h header for vmware tools."
        pushd /lib/modules/$KVER/build/include/linux/
        ln -s ../generated/uapi/linux/version.h
        popd
    fi

    apt-get install build-essential gcc build-essential linux-headers-$(uname -r) dkms make
    pushd /tmp
    pushd vmware-tools-distrib
    wget https://raw.github.com/ebdevrepo/bin/master/vmware9.k3.8rc4.patch
    wget https://raw.github.com/ebdevrepo/bin/master/vmware_vmci_fix.sh
    chmod +x ./vmware_vmci_fix.sh
    ./vmware_vmci_fix.sh
    wget https://raw.github.com/ebdevrepo/bin/master/vmware9.compat_mm.patch
    wget https://raw.github.com/eedgar/vmware_fedora_fixes_bin/master/vmware9.k3.9.patch
    wget https://raw.github.com/eedgar/vmware_fedora_fixes_bin/master/vmware_hgfs_fix.sh
    chmod +x ./vmware_hgfs_fix.sh
    ./vmware_hgfs_fix.sh
    popd

    /tmp/vmware-tools-distrib/vmware-install.pl --clobber-kernel-modules=vmci -d

    rm -rf vmware-tools-distrib
    popd

    rm /home/vagrant/linux.iso
fi
