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

# files and directories
itemarray=( '/path to/dir/'* )
item0=${itemarray[0]}

# files
filearray=( '/path to/dir/'*.* )
file0=${filearray[0]}

# directories
dirarray=( '/path to/dir/'*/ )
dir0=${dirarray[0]}
```
