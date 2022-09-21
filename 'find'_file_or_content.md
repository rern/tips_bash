
**Find file by name**
```sh
find . -name 'filename*' # . = current directory
find /path -name 'filename*'
find /path -name 'filename*' -exec command {} \; # {} = found item
```

**Find by type**
```sh
# all files
find /path -type f
# all directories
find /path -type d
```

**Find content in files**
```sh
# show file:content
grep -rni 'pattern' /path
#    -r recursive
#    -n show line number
#    -l show filename instead
#    -i case insensitive

# or
egrep -ir 'pattern' /path
egrep -ir --include=*.{ext,ext1} 'pattern' /path

# 'l' - list of files
egrep -irl 'pattern' /path
egrep -irl --include=*.{ext,ext1} 'pattern' /path
```

**Find latest modified**
```sh
find . -type f -printf '%TF %TT %p\n' | sort | tail -1   # '-1' = show 1 file
```

