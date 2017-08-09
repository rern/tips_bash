chmod
---

`-R` : recursive  
`-f` : quite  
```sh
# codes
# all / user / group / others
# chmod ' '/u/g/o|+/-|r/w/x file
chmod g+rw file

# numerics
# 'ugo' each sum of: r=4 w=2 x=1
# chmod ugo file
chmod 755 file

# add executable to all `*.py` file in `/path` and sub directories  
find /path/. -name "*.py" -exec chmod +x {} +
```
