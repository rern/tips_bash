
**Find file by name**
```sh
find . -name 'filename*' # '.' = current directory
find /path -name 'filename*'
find /path -name 'filename*' -exec command
```

**Find content in files**
```sh
# show file:content 
egrep -ir --include=*.{ext,ext1} "content" /path

# 'l' - list of files
egrep -irl --include=*.{ext,ext1} "content" /path
```
