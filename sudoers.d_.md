/etc/sudoers.d/
---

- create file in drop-in directory instead of `visudo`
- allow `user` on `ALL` host `NOPASSWD` sudo `ALL` commands : `user ALL=NOPASSWD: ALL`
- files should be verified with `visudo -c -f /etc/sudoers.d/file`
- file name must not contain `~` or `.`
- multiple files will be parsed alphabetically
- directory permissions: 550, dr-xr-x--- (at least)
- file permission: 440, -r--r----- (may not be necessary)

To directly edit `/etc/sudoers` with `nano` : `EDITOR=nano visudo`  
