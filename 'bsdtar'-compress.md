bsdtar
---

`-x` extract  
`-v` verbose  
`-p` keep files permissions  
`-f` file (must be right before compressed.file)  

`-c` compress  
`-J` xz (for compress)  

**Extract to current directory**  
```sh
bsdtar -xf compressed.file
```

**Extract to target**
```sh
bsdtar -xf compressed.file -C /target
```

**Extract not include root directory of compressed.file to target**
```sh
bsdtar -xf compressed.file -s'|[^/]*/||' -C /target
```

**Compress to xz**  
```sh
bsdtar -cJf compressed.file.xz files
```
