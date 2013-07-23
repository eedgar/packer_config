# nfs client install

yum -y install nfs-utils

systemctl start rpcbind.service
systemctl start nfs-server.service
systemctl start nfs-lock.service
systemctl start nfs-idmap.service

systemctl enable rpcbind.service
systemctl enable nfs-server.service
systemctl enable nfs-lock.service
systemctl enable nfs-idmap.service
