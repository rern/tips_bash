### Identify CPU core number of a process
```sh
ps -Fae | grep '^UID\|PSMAME'
# where PSR = CPU core number
```
