## std

### Stream
- `0` stdin
- `1` stdout
- `2` stderr

### Redirect
- `>` - default to `1>` stdout
- `>>` - append
- `2>` - stderr
- `&>` shorthand for `2>&1 >` - stderr + stdout
- `> /dev/null` - suppress
- `<<` - here doc (no expansion) - read `EOF` to variable or file
- `<<<` - here string (with expansion) - read variable as stdin
