## `ls`
```sh
# details
ls -l /path

# 1 file 1 line
ls -1 /path

# filename without path
ls -1 /path/file* | xargs -n1 basename

# directories only
ls -d /path/*/ | sed 's|/$||'
```
