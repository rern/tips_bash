### NFS server
- Setup script: 
```sh
bash <( curl -L https://github.com/rern/tips_bash/raw/master/nfsshare.sh )
```

```sh
pacman -Sy nfs-utils # debian: nfs-kernel-server

# shared directory
share=/PATH/DIR
mkdir $share
chmod -R 777 $share # 777 = rwx
echo "$share 192.168.1.0/24(rw,sync,no_subtree_check)" >> /etc/exports

systemctl restart nfs-server # debian: nfs-kernel-server
```
### NFS client
```sh
mountpoint=/mnt/DIR
mkdir $mountpoint
mount SERVER_IP:$share $mountpoint
```
