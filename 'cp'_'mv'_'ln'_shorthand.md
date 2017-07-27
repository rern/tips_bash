`cp`, `mv`, `ln` shorthand
---
with brace expansion
```sh
# /path/filename.ext

mv /path/filename.{ext,new}      # /path/filename.new
mv /path/filename.new{,.bak}     # /path/filename.new.bak
mv /path/filename.new.bak{.bak,} # /path/filename.new
mv /path/file{name.n,xx.xx}ew    # /path/filexx.xxew
```
