/etc/sudoers.d/
---

- directory permissions: 550 (dr-xr-x---)
- create file in drop-in directory instead of `visudo`
- verify with `visudo -c -f /etc/sudoers.d/file`

To directly edit `/etc/sudoers` with `nano` : `EDITOR=nano visudo`  
