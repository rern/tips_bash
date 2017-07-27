**chmod file pattern recursively**  
add executable to all `*.py` file in `/path` and sub directories  
```sh
find /path/. -name "*.py" -exec chmod +x {} +
```
