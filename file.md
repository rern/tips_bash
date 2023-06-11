### File
- Empty: `[[ ! -s FILE ]] && echo Empty`
- Empty of white spaces only: `[[ ! $( awk NF FILE ) ]] && echo Empty or white spaces only`
- Duplicate lines: `! awk 'a[$0]++{exit 1}' FILE && echo Duplicate found` (includes empty / white spaces lines)
