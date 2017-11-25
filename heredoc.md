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
```
- ending `EOF` must has no leading space
