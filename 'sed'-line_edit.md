sed
---

`-i` : in-place edit input file  
`-e` : sequence edit  

`$'...\'...\'...'` : `$` + escaped `'` inside single quote  
`'...\x27...\x27...` : `'` hex character
`"...\"...\"..."` : escaped `"` inside double quote  
`'...\x22...\x22...` : `"` hex character
`"...$var..."` : variable inside double quotes
`'...'$var'...'` : variable outside quotes   
  
`/.../` : search line (left escaped delimiter `\|` for `\|...|`)  
`/1st.../, /last.../` : search line range search (top - line 0)  
`'N ...'` : search Nth line (`\` needed for escaped new line)  
`'$ ...'` : search last line (`\` needed for escaped new line)  

`'/.../ i\ ...'` : `i` insert before line (`\` needed for escaped new line)  
`'/.../ a\ ...'` : `a` append after line (`\` needed for escaped new line)  
`'/.../ d` : `d` delete line
`'/^\s*$/ d'` : delete blank lines  
`'n1, n2 d; n3 d'` : delete range of line numbers and line

`-n '/.../p'` : get line string  
`-n '/.../='` : get line number  

`s/` : substitute delimiter can be any symbol or character (single byte)  
`'s/a.../b.../'` : `s` substitute `a...` with `b...`  
`'s/a.../b.../g'` : `g` global - substitute all  
[alternative brace expansion](https://github.com/rern/tips/blob/master/bash/string_extract_edit.md)  
`'s/a.../&b.../'` : append `b...` to `a...`  
`'/^a.../ s/^/b.../'` : prepend `b...` to the begining of line start with `a...`  
`'/^a.../ s/$/b.../'` : append `b...` to the end of line start with `a...`  

`.` : single character wildcard  
`.*` : multiple character wildcard  
`\?` : 0 or 1 of preceding character  
`\+` : 1 or more of preceding character  
`*` : 0 or more of preceding character  

`'/[...]/'` : any characters in `[...]`  
`'/[^...]/'` : `[^` not any characters in `...]`  
`'/[^ ]*/'` : `*` zero or more characters that `^` are not space  

`'/^.../'` : start with  
`'/^[...]/'` : start with any in `[ ]`  
`/...$/` : end with  
`'/[...]$/'` : end with any in `[ ]`  
`/^$/` : blank line  

`'/a...\|b.../'` : pattern `a...` or `b...`  
`'/[...]\|.../'` : any characters in `[...]` or pattern `...`  
`'[^...\{...\}]$'` : `[^` not `$` end with any characters in `[...` or pattern in `\{...\}`

`\ . . ` : '\\' start insert lines with multiple spaces / tabs  
`\s` : space or tab  
`\t` : tab (GNU sed only)  
`\n` : new line  
`\r` : return  
`$'...\t...\n\r'` : `$` fix `\t` `\n` `\r` character result as `t` `n` `r`  

`...\` : escaped new line at line end within single quote  
`...\\` : escaped new line within double quote (escaped backslash `\`)  
`$ . * [ ] ^ \` : escape characters   
