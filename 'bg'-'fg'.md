### Send running process to background
- `Ctrl`+`z` - pause process
- `bg`
- `disown -h %1`

### Bring running process to foreground
- `jobs` - get process ID
- `fg %ID`

### Run process in background
- `nohup PROCESS &` - independent from shell with **noh**_ang_**up**
