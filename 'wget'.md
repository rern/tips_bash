wget
---

**wget GitHub URL conversion**  
```sh
# github url: https://github.com/rern/RuneUI_enhancement/blob/master/install.sh
# convert #1: <github.com> -> <raw.githubusercontent.com> ; <blob> -> remove
#           : https://raw.githubusercontent.com/rern/RuneUI_enhancement/master/install.sh
# convert #2: <blob> -> <raw>
#           : https://github.com/rern/RuneUI_enhancement/raw/master/install.sh
```

**flags**  
`-q --show-progress` : quite but show progress bar  
`-P` : download to path, create if not exist  
`-O` : overwrite existing file (specify /path/filename)  
`--no-check-certificate` : fix certificate error  
