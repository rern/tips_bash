
**Find file by name**
```sh
find . -name 'filename*' # '.' = current directory
find /path -name 'filename*'
find /path -name 'filename*' -exec command
```

**Find content in files**
```sh
# show file:content
egrep -ir "content" /path
egrep -ir --include=*.{ext,ext1} "content" /path

# 'l' - list of files
egrep -irl "content" /path
egrep -irl --include=*.{ext,ext1} "content" /path
```

**Find latest modified**
```sh
find . -type f -printf '%TF %TT %p\n' | sort | tail -1   # '-1' = show 1 file
```

