- Update database: `pacman -Sy`
- Update then install `pacman -Sy PACKAGE`
- Install `pacman -S PACKAGE`
- Silent install `pacman -S --noconfirm PACKAGE`
	- when `--noconfirm` not working: `echo "y \n" | pacman -S --noconfirm PACKAGE`
- Download only `pacman -Sw PACKAGE`
- List all installed packages`pacman -Qqe`
- List files installed `pacman -Ql PACKAGE`
- Check installed package `pacman -Q PACKAGE`
- Check detail of installed package `pacman -Qi PACKAGE`
- Search package `pacman -Qs PACKAGE` (can use wildcards)
- Search package contains command `pacman -Qo COMMAND`
- Search package contains file `pacman -Fy FILE`
- Recreate package from installed**  `bacman PACKAGE`
- Install from file `pacman -U PACKAGE_FILE`
- Uninstall `pacman -R PACKAGE`
- Uninstall with all depends `pacman -Rcns PACKAGE`
- System wide upgrade `pacman -Syu`
- Remove outdated packages from cache `pacman -Sc`
- Package repo 
	- Latest - https://archlinuxarm.org/packages  
	- Archive - http://tardis.tiny-vps.com/aarm/  
