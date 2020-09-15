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

# rwxrwxrwx = 777
# rwxr-xr-x = 755
# rwxr--r-- = 744
# rw------- = 600

# directories 775 - rwxrwxr-x; file 664 - rw-rw-r--
chmod -R ug=rw,o=r,a+X /path/to/folder/

# add executable to all `*.py` file in `/path` and sub directories  
find /path/. -name "*.py" -exec chmod +x {} +
```
