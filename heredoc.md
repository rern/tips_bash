### Here Strings `<<<`
Alternative to `echo "$VAR"`
```sh
COMMAND <<< $VAR
```

### Here Documents `<<`
Any characters or symbols without escape
- `'` or `"` quotes for starting `'EOF'` = no `$variable` expansion inside
- omit the quotes allows `$varisble` inside and literal `$` must be escaped
- ending `EOF` must has neither space nor any other characters
```sh
var=$( cat << 'EOF'
any characters or symbols without escaping
@#$&*()'"%-+=/;:!?€£¥_^[]{}§|~\\<>
EOF
)
echo "$var"

cat << EOF > /path/file
any characters or symbols without escaping
@#$&*()'"%-+=/;:!?€£¥_^[]{}§|~\\<>
EOF
```

### Read File `<`
```sh
VAR=$( < $FILE )
```

### Process Substitution `<( COMMAND )`
Pipe stdout of multiple commands
