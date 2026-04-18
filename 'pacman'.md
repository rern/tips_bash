### Install
- Update database: `pacman -Sy`
- Update then install `pacman -Sy PACKAGE`
- Install `pacman -S PACKAGE`
- Silent install `pacman -S --noconfirm PACKAGE`
	- when `--noconfirm` not working: `echo "y \n" | pacman -S --noconfirm PACKAGE`
- Install from file `pacman -U PACKAGE_FILE`
- Download only `pacman -Sw PACKAGE`
- System wide upgrade `pacman -Syu`

### Remove
- Uninstall `pacman -R PACKAGE`
- Uninstall with all depends `pacman -Rcns PACKAGE`
- Remove outdated package files from cache `pacman -Sc`

### Query
- Installed:
	- Version `pacman -Q PACKAGE`
	- Detail `pacman -Qi PACKAGE`
	- Own command/file `pacman -Qo COMMAND`
	- List:
		- All packages `pacman -Qqe`
		- Files `pacman -Ql PACKAGE`
- Search:
	- Name `pacman -Qs PACKAGE` *(`*` wildcards allowed)*
	- Contains command/file `pacman -F COMMAND`
	- Detail: `pacman -Si PACKAGE`
		- Depends `pacman -Si PACKAGE | awk -F': ' '/^Depends/ {gsub(/ +/, "\n", $2); print $2}'`
		- Provides `*.so=version` `*.so=version` ` pacman -Si PACKAGE | grep -E '^Provides|^Version'`

### Recreate package from installed
- `fakepkg PACKAGE`

### Repositories
- Latest - https://archlinuxarm.org/packages  
- Archive - http://tardis.tiny-vps.com/aarm/  
