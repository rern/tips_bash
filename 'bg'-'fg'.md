### Send running process to background
- `Ctrl`+`z` - pause process
- `bg`
- `jobs` - get process ID
- `disown -a`

### Bring running process to foreground
- `jobs` - get process ID
- `fg % ID`

### Run process in background
- `nohub PROCESS &` - independent from shell with **no hangup**
