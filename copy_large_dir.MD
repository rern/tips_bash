Copt Large Directories
---

```sh
# tar
(cd /src; tar cf - .) | (cd /dst; tar xpf -)

# for some leftout files
cd /dst; rsync -avPHSx --delete /src/ .
```
