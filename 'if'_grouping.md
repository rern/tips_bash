**if**  

```sh
# group ('[[' bash only)
if [[ expression && expression || expression ]]; then
# or
if [[ expression ]] && [[ expression ]] || [[ expression ]]; then

# sub group
if [[ expression && ( expression || expression ) ]]; then
# or
if [[ expression ]] && { [[ expression ]] || [[ expression ]]; }; then # ';' before closing curly brace
```
