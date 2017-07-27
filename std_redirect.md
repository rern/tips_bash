**stdin, stdout, stderr**  

`command1 | command2` : stdout pipe to `command2`  
`command > file` : stdout to `file`  
`command 2> file` : stderr `2` to `file`  
`command 2>&1` : stderr `2` to stdout `1`  
`command &> /dev/null` : suppress all `&` (stderr `2` and stdout `1`)  

accummulate std to single output  
```sh
{
  command1
  command2
  command3
} &> /dev/null
```
