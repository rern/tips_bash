### NFS server
- Setup script: 
```sh
bash <( curl -L https://github.com/rern/tips_bash/raw/master/nfsshare.sh )
```

```sh
pacman -Sy nfs-utils # debian: nfs-kernel-server

share=/PATH/DIR
mkdir $share
chmod -R 777 $share # 777 = rwx
ip=$( ifconfig | grep -m1 inet.*broadcast | awk '{print $2}' )
echo "$share ${ip%.*}.0/24(rw,sync)" >> /etc/exports

systemctl restart nfs-server # debian: nfs-kernel-server
```
### NFS client
```sh
mountpoint=/mnt/DIR
mkdir $mountpoint
mount SERVER_IP:$share $mountpoint
```
