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

### Checksum
```sh
read -p 'Package Name: ' PACKAGE
read -p Repo REPO
file=$( ls /var/cache/pacman/pkg/$PACKAGE-* )
sha_file=$( sha256sum $file | awk '{print $1}' )
sha_db=$( bsdtar xOf /var/lib/pacman/sync/$REPO.db \
			| sed -n -e "/^$PACKAGE$/,/^%URL/ p" \
			| sed -n '/^%SHA/ {n;p}' )
if [[ $sha_file == $sha_db ]]; then
	echo -e "\n\e[46m  \e[0m Verified\n"
else
	echo -e "\n\e[41m i \e[0m NOT matched !
$sha_file
$sha_db
"
fi
```

### Recreate package from installed
- `fakepkg PACKAGE`

### Repositories
- Latest - https://archlinuxarm.org/packages  
- Archive - http://tardis.tiny-vps.com/aarm/  
