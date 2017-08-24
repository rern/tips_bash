wget
---

**wget GitHub URL conversion**  
- file
```sh
#  page url : https://github.com/<name>/<repository>/blob/master/<file>
#        #1 : <blob> -> <raw> (the 'Raw' button)
#           : https://github.com/<name>/<repository>/raw/master/<file>
#        #2 : <github> -> <raw.github> ; <blob> -> remove
#           : https://raw.github.com/<name>/<repository>/master/<file>
#    direct : <github.com> -> <raw.githubusercontent.com> ; <blob> -> remove
#           : https://raw.githubusercontent.com/<name>/<repository>/master/<file>
```
- repository
```sh
#  page url : https://github.com/<name>/<repository>
#           : <...> -> <.../archive/master.zip> (the 'Download ZIP' button)
#           : https://github.com/<name>/<repository>/archive/master.zip
#    direct : <github.com> -> <codeload.github.com> ; <...> -> <.../zip/master>
#           : https://codeload.github.com/<name>/<repository>/zip/master -O <file>.zip
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

**fix certificate error**  
update time to current:
```sh
systemctl stop ntpd
ntpdate pool.ntp.org
systemctl start ntpd
```
