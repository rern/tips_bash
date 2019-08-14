**rsync** - Copy directory
```sh
rsync --ignore-existing --progress -rvh /source/path /dstination/path
```
- `-r` recursive
- `-v` verbose
- `-h` human unit

**dd** - Clone disk / partition
```sh
# get disks
fdisk -l

# clone disk
dd if=/dev/sdb of=/dev/sdc

# clone partition
dd if=/dev/sdb1 of=/dev/sdc1
```
- `if=` source disk / partition  
- `of=` destination disk / partition  
