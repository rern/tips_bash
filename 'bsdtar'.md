bsdtar
---

`-x` extract  
`-v` verbose  
`-p` keep files permissions  
`-f` file (must be right before file.tar.xz)  

`-c` compress  
`-J` xz (for compression)  

**Extract to current directory**  
```sh
bsdtar -xf file.tar.xz
```

**Extract to target**
```sh
mkdir target
bsdtar -xf file.tar.xz -C target
```

**Extract sub directory**
```sh
bsdtar -xf file.tar.xz -C target subdirectory/
```

**Extract not include root directory of compressed.file to target**
```sh
bsdtar -xf file.tar.xz --strip 1 -C target
```

**Compress to xz**  
```sh
bsdtar -cJf file.tar.xz files
```
