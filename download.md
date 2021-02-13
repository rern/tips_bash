### Download file 
**`curl`**
- `-L` get file
- `-O` remote name
- `-s` silent
```sh
# view file
curl -L http://URL/...

# download file
curl -LO http://URL/... # wget - not overwrite

wget http://URL/... -P /target/path # curl - no option for target

# download + extract file
curl -L http://URL/... | bsdtar xf -
```

**SSH `scp`**
```sh
scp user@ipaddress:/remote/path/file /local/path
```
