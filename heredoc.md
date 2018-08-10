heredoc
---

any characters or symbols without escape

- `'` or `"` quotes for starting `'EOF'` = no `$` expansion inside
- omit the quotes allow variables inside (literal `$` must be escaped)
- ending `EOF` must has neither space nor any other characters
```sh
var=$(cat <<'EOF'
any characters or symbols without escaping
@#$&*()'"%-+=/;:!?€£¥_^[]{}§|~\\<>
EOF
)
echo "$var"
```
