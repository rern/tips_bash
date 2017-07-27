**Update**  
```sh
pacman -Sy
```

**Update then install**  
```sh
pacman -Sy package
```

**Install**  
```sh
pacman -S package
```

**Silent install**  
```sh
pacman -S --noconfirm package
```

**Download only**  
```sh
pacman -Sw package
```

**Install from file**  
```sh
pacman -U package_file
```

**Uninstall**  
```sh
pacman -R package_file
```

**Uninstall with unused depends**  
```sh
pacman -Rs package_file
```

**System wide upgrade**  
```sh
pacman -Syu
```

**Package repo**  
Latest - https://archlinuxarm.org/packages  
Archive - http://tardis.tiny-vps.com/aarm/  
