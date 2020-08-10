bsdtar
---

`-c` compress
- `-J` xz compression
- `-j` bzip2 compression
- `-lzma` lzma compression
- `-z` gzip compression

`-x` expand  
`-v` verbose  
`-p` keep files permissions  
`-f` target file (must be right before file)  

**Expand to current directory**  
```sh
bsdtar -xf file.tar.xz
```

**Expand to target**
```sh
mkdir target
bsdtar -xf file.tar.xz -C target
```

**Expand sub directory**
```sh
bsdtar -xf file.tar.xz -C target subdirectory/
```

**Expand not include root directory of compressed.file to target**
```sh
bsdtar -xf file.tar.xz --strip 1 -C target
```

**Compress to xz**  
```sh
bsdtar -cJf file.tar.xz files
```
