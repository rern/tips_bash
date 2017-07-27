ext4 partiton
---

**USB <> hdd speed**  
on Ubuntu - Nautilus  
- USB3 hdd ext3 > hdd ntfs ≈ 35MB/s
- hdd ntfs > USB3 hdd ext3 ≈ ?MB/s
- USB3 hdd ext4 > hdd ntfs ≈ 70MB/s
- hdd ntfs > USB3 hdd ext4 ≈ 70MB/s

on Windows - [Linux Reader](https://www.diskinternals.com/linux-reader/)  
- USB3 hdd ext3 > hdd ntfs ≈ ?MB/s
- USB3 hdd ext4 > hdd ntfs ≈ 60MB/s

**create partition**
```bash
fdisk /dev/sda

# format partition
mkfs.ext4 /dev/sda1

# label
e2label /dev/sda1 labelname
```

**improve transfer**
```bash
# display 'has_journal'
dumpe2fs /dev/sda1 | grep 'Filesystem features'

# disable journal
tune2fs -O ^has_journal /dev/sda1

# display 'noatime'
mount | grep '/dev/sda1'

# mount no access time
mount /dev/sda1 /path -o noatime
```
