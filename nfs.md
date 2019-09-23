### NFS server
```sh
# arch linux
pacman -Sy nfs-utils

# debian
apt update
apt install install nfs-kernel-server nfs-common

# create share directory
mkdir /home/test
chown nobody:nogroup /home/test
chmod 777 /home/test

# share
echo /home/test 192.168.1.0/24(rw,sync,no_subtree_check) >> /etc/exports

# restart server
systemctl restart nfs-server        # arch linux
systemctl restart nfs-kernel-server # debian
```
### NFS client
```sh
# creat mountpoint
mkdir /mnt/test

# server ip: 192.168.1.11
mount 192.168.1.11:/home/test /mnt/test
```
