heredoc
---

any characters or symbols without escape

- `'` quote for starting `'EOF'` = no `$` expansion inside
```sh
var=$(cat <<'EOF'
any characters or symbols without escaping
@#$&*()'"%-+=/;:!?€£¥_^[]{}§|~\\<>
ending `EOF` must has neither space nor any other characters
EOF
)
echo "$var"
```
