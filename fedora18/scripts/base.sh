# Base install

# Must exclude kernel for now. Otherwise, kernel gets upgraded before reboot,
# but VirtualBox tools get compiled against the old kernel, so the fresh
# image will refuse to start under Vagrant.

yum -y install gcc make gcc-c++ zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms tar bzip2 net-tools vim screen
