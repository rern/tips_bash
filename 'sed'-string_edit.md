sed
---
`$ . * [ ] ^ \` : characters require escape (only in regex pattern)  

**flags**  
`-i` : **i**n-place edit input file  
`-e` : **e**xpressions in sequence  
`-n` : li**n**e indication  

**variables / quotes**  
`$'...\'...\'...'` : `$` + escaped `'` inside single quote  
`'...\x27...\x27...` : `'` hex character  
`"...\"...\"..."` : escaped `"` inside double quote  
`'...\x22...\x22...` : `"` hex character  
`"...$var..."` : variable inside double quotes  
`'...'$var'...'` : variable outside quotes  

**operators**  
`'s/.../.../'` : substitute 1st match, delimiter can be any symbol or character (single byte)  
`'s/.../.../g'` : `g` **g**lobal matches  
`'... i\ ...'` : `i` **i**nsert before line (`\` needed for escaped every new line)  
`'... a\ ...'` : `a` **a**ppend after line (`\` needed for escaped every new line)  
`'... d` : `d` **d**elete line
`'/.../ <x1>; <x2>'` : multiple operations with `;`  

**line search**  
\* `<x>` : `i`, `a`, `d`, `p`  
\* `<n>` : number  

`-n '/.../p'` : **p**rint line string by matched  
`'<n>q;d'` : get line string by line number  
`-n '/.../='` : get line number 

`/.../ <x>` : search line (left escaped delimiter `\|` for `\|...|`)  
`'/^.../'` : `^` start with  
`/...$/` : `$` end with  
`/^$/` : blank line  
`'<n> <x>'` : search \<n\>th line  
`'1 <x>'` : search 1st line  
`'$ <x>'` : search last line  
`'/^\s*$/ <x>'` : search all blank lines  

`/<1st>/, /<last>/ <x>` : search line range  
`/.../, +<n> <x>` : search line range from match to next \<n\> line  

`'/.../{N; <x>}'` : match line includes **N**ext line  
`'/.../{n; <x>}'` : line **n**ext to match  
`'/.../{n;n <x>}'` : 2nd line **n**ext to match  
`$(( $( sed -n '/.../=' $file ) - <n> ))' <x>'` : search \<n\> line prior to match  

**escaped new lines**  
`...\` : escaped new lines within single quote  
`...\\` : escaped new lines within double quote (escaped backslash `\`)  

**string search**  
[simple brace expansion](https://github.com/rern/tips/blob/master/bash/string_extract_edit.md)  
`'s/a.../b.../'` : `s` **s**ubstitute `a...` with `b...`  
`'s/a.../b.../g'` : `g` **g**lobal - substitute all  
`'s/a.../&b.../'` : append `b...` to `&` `a...`  
`'s/a.../b...&/'` : prepend `b...` to `&` `a...`  
`'/^a.../ s/^/b.../'` : prepend `b...` to the `^` begining of line start with `a...`  
`'/^a.../ s/$/b.../'` : append `b...` to the `$` end of line start with `a...`  

**wildcards**  
`.` : single character wildcard  
`.*` : multiple character wildcard  
`\?` : 0 or 1 of preceding character  
`\+` : 1 or more of preceding character  
`*` : 0 or more of preceding character  

**pattern list**  
`'/[...]/'` : any characters in `[...]`  
`'/[^...]/'` : `[^` not any characters in `...]`  
`'/[^ ]*/'` : `*` zero or more characters that `^` are not space  
`'/^[...]/'` : start with any character in `[ ]`  
`'/[...]$/'` : end with any character in `[ ]`  
`'/a...\|b.../ <x>'` : string `a...` or `b...` (`\` needed for escaped `|`)  

**mixed patterns**  
`'/[...]\|.../'` : any characters in `[...]` or pattern `...` (`\` needed for escaped `|`)  
`'[^...\{...\}]$'` : `[^` not `$` end with any characters in `[...` or pattern in `\{...\}`

**escaped characters**  
`\ . . ` : '\\' start insert lines with multiple spaces / tabs  
`\s` : space or tab  
`\t` : tab (GNU sed only)  
`\n` : new line  
`\r` : return  
`$'...\t...\n\r'` : `$` escapes `\t` `\n` `\r` to  `t` `n` `r`    
