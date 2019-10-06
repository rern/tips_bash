**Update**  
```sh
pacman -Sy
```

**Update then install**  
```sh
pacman -Sy <package>
```

**Install**  
```sh
pacman -S <package>
```

**Silent install**  
```sh
pacman -S --noconfirm <package>
```

**Pass ,`y` to remove conflicts > install** (when `--noconfirm` not working)
```sh
echo "y \n" | pacman -S --noconfirm <package>
```

**Download only**  
```sh
pacman -Sw <package>
```

**List installed**  
```sh
pacman -Qqe
```

**Check installed package**  
```sh
pacman -Qi <package>
```

**Recreate package from installed**  
```sh
bacman <package>
```

**Install from file**  
```sh
pacman -U <package_file>
```

**Uninstall**  
```sh
pacman -R <package>
```

**Uninstall with all depends**  
```sh
pacman -Rcns <package>
```

**System wide upgrade**  
```sh
pacman -Syu
```

**Remove outdated packages from cache**  
```sh
pacman -Sc
```

**Package repo**  
Latest - https://archlinuxarm.org/packages  
Archive - http://tardis.tiny-vps.com/aarm/  
