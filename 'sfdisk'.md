```sh
echo 'start,size,type,bootable' | sfdisk /dev/sdx
```
default  
`start` first available sector  
`size` largest from start  
`type` linux  
`bootable` no  

Create single partition
```sh
echo ',' | sfdisk /dev/sdx
```

Create single FAT partition
```sh
echo ',,c' | sfdisk /dev/sdx
```

Create 2 partitions: 2.4GB + the rest
```sh
echo -e ',2.4G\n,' | sfdisk /dev/sdx
```

Create 3 partitions: 2.4GB + 1.2GB + the rest
```sh
echo -e ',2.4G\n,1.2G\n,' | sfdisk /dev/sdx
```
