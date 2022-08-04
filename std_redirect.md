**stdin, stdout, stderr**  

Stream
- `0` stdin
- `1` stdout
- `2` stderr

Redirect
- `|` pipe
  - `command1 | command2` : stdout pipe to `command2`
- `>` pass content to file
  - `command > file` : stdout to `file` (`1>`)
  - `command 2> file` : stderr `2` to `file`
  - `command &> file` : stderr `2` + stdout `1` to `file` (`2>&1`)
  - `command &> /dev/null` : suppress all
- `<` pass content from file
  - `readarrary -t array < file`
- `<<` heredoc
  - `var=$( cat << EOF` - set var
  - `cat << EOF > file` - pass content to file
- `<<<` herestring - pass content to command
  - `command2 <<< $( command1 )` : multiline stdout to `command2`
  - `command <<< "$var"` : read variable as multiline stdin (here string)

accummulate stdout
```sh
{
  command1
  command2
  command3
} > file
```
