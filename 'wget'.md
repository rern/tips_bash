wget
---

**wget GitHub URL conversion**  
```sh
# github url: https://github.com/<name>/<repository>/blob/master/<file>
# direct    : <github.com> -> <raw.githubusercontent.com> ; <blob> -> remove
#           : https://raw.githubusercontent.com/<name>/<repository>/master/<file>
# indirect  : <blob> -> <raw>
#           : https://github.com/<name>/<repository>/raw/master/<file>
```

**flags**  
`-q --show-progress` : quite but show progress bar  
`-P` : download to path, create if not exist  
`-O` : overwrite existing file (specify /path/filename)  
`--no-check-certificate` : fix certificate error  

**filename range**  
```sh
wget https://url.com/file.{1..30}
```
