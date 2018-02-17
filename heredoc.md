heredoc
---

- append `any characters or symbols without escaping` to `$file`
- (single quote leading `'EOF'` = no `$` expansion)
```sh
cat << 'EOF' >> $file
any characters 
or symbols 
without escaping
EOF

var=$(cat << 'EOF'
any characters or symbols without escaping
$^.*'"/\{([])}|&^%
except ^ as 1st character
end a line with `\` to suppress newline\
    preserve spaces but tab
EOF
)
echo "$var"
```
- ending `EOF` must has no leading space nor any other characters
