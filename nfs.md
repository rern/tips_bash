### NFS server
```sh
pacman -Sy nfs-utils # debian: apt update; apt install nfs-kernel-server

# shared directory
share=/PATH/DIR
mkdir $share
chmod -R 777 $share # 777 = rwx
echo "$share 192.168.1.0/24(rw,sync,no_subtree_check)" >> /etc/exports

systemctl restart nfs-server # debian: systemctl restart nfs-kernel-server
```
### NFS client
```sh
mountpoint=/mnt/DIR
mkdir $mountpoint
mount SERVER_IP:$share $mountpoint
```
