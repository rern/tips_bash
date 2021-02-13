### Download file - 
**`curl`**
- `-L` get file
- `-O` remote name
- `-s` silent
```sh
# view file
curl -L http://URL/...

# download file
curl -LO http://URL/...

# download + extract file
curl -L http://URL/... | bsdtar xf -
```

**`scp`**
```sh
scp user@ipaddress:/remote/path/file /local/path
```
