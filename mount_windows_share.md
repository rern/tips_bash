### Mount Windows Share

**On Windows**
- Create user id with password on Windows (Blank password not allowed by default)
- Create share with permission to created user

**On Linux**
```sh
# list shares
smbclient -L nameOrIP -U userid 

# mount share
mount -t cifs //nameOrIP/sharename /path/to/mountpoint -o user=userid,password=password
```
