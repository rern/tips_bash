### Send running process to background
- `Ctrl`+`z` - pause process
- `bg`
- `jobs` - get process ID
- `disown -h %ID`

### Bring running process to foreground
- `jobs` - get process ID
- `fg %ID`

### Run process in background
- `nohup PROCESS &` - independent from shell with **noh**_ang_**up**
