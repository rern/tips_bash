heredoc
---

any characters or symbols without escape

- `'` or `"` quotes for starting `'EOF'` = no `$variable` expansion inside
- omit the quotes allows `$varisble` inside and literal `$` must be escaped
- ending `EOF` must has neither space nor any other characters
```sh
var=$(cat <<'EOF'
any characters or symbols without escaping
@#$&*()'"%-+=/;:!?€£¥_^[]{}§|~\\<>
EOF
)
echo "$var"
```
