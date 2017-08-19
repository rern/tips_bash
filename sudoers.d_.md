/etc/sudoers.d/
---

- directory permissions: 550 (dr-xr-x---)
- create file in drop-in directory instead of `visudo`
- allow `user` on `ALL` host `NOPASSWD` sudo `ALL` commands : `user ALL=NOPASSWD: ALL`
- should be verified with `visudo -c -f /etc/sudoers.d/file`
- multiple files will be parse alphabetically

To directly edit `/etc/sudoers` with `nano` : `EDITOR=nano visudo`  
