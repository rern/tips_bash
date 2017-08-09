sed
---

**flags**  
`-i` : in-place edit input file  
`-e` : sequence edit   

**variables / quotes**  
`$'...\'...\'...'` : `$` + escaped `'` inside single quote  
`'...\x27...\x27...` : `'` hex character  
`"...\"...\"..."` : escaped `"` inside double quote  
`'...\x22...\x22...` : `"` hex character  
`"...$var..."` : variable inside double quotes  
`'...'$var'...'` : variable outside quotes  

**get line**  
`-n '/.../p'` : get line string by matched  
`'<n>q;d'` : get line string by line number  
`-n '/.../='` : get line number 

**operators**  
`'... i\ ...'` : `i` insert before line (`\` needed for escaped new line)  
`'... a\ ...'` : `a` append after line (`\` needed for escaped new line)  
`'... d` : `d` delete line
`'/^\s*$/ d'` : delete blank lines  
`'<n1>, <n2> d; <n3> d'` : delete range of line numbers and line 
`s/` : substitute - delimiter can be any symbol or character (single byte)  

**line search**  
\* `<x>` : `i`, `a`, `d`, `p`  
\* `<n>` : number  
`/.../ <x>` : search line (left escaped delimiter `\|` for `\|...|`)  
`'/^.../'` : start with  
`/...$/` : end with  
`/^$/` : blank line  
`'<n> <x>'` : search \<n\>th line  
`'1 <x>'` : search 1st line  
`'$ <x>'` : search last line  
`'/.../{N; <x>}'` : search match line includes next line `N`  
`'/.../{n; <x>}'` : search line `n` next to match  
`'/.../{n;n <x>}'` : search 2nd line `n;n` next to match  
`$(( $( sed -n '/.../=' $file ) - <n> ))' <x>'` : search \<n\> line prior to match  
`/<1st>/, /<last>/ x` : search line range  
`/.../, +<n> <x>` : search line range from match to next \<n\> line  
`'/a...\|b.../'` : pattern `a...` or `b...` (`\` needed for escaped `|`)  

**escaped new lines**  
`...\` : escaped new lines within single quote  
`...\\` : escaped new lines within double quote (escaped backslash `\`)  

**string search**  
`'s/a.../b.../'` : `s` substitute `a...` with `b...`  
`'s/a.../b.../g'` : `g` global - substitute all  
[alternative brace expansion](https://github.com/rern/tips/blob/master/bash/string_extract_edit.md)  
`'s/a.../&b.../'` : append `b...` to `a...`  
`'/^a.../ s/^/b.../'` : prepend `b...` to the begining of line start with `a...`  
`'/^a.../ s/$/b.../'` : append `b...` to the end of line start with `a...`  

**wildcards**  
`.` : single character wildcard  
`.*` : multiple character wildcard  
`\?` : 0 or 1 of preceding character  
`\+` : 1 or more of preceding character  
`*` : 0 or more of preceding character  

**characters list**  
`'/[...]/'` : any characters in `[...]`  
`'/[^...]/'` : `[^` not any characters in `...]`  
`'/[^ ]*/'` : `*` zero or more characters that `^` are not space  
`'/^[...]/'` : start with any in `[ ]`  
`'/[...]$/'` : end with any in `[ ]`  

**mixed patterns**  
`'/[...]\|.../'` : any characters in `[...]` or pattern `...` (`\` needed for escaped `|`)  
`'[^...\{...\}]$'` : `[^` not `$` end with any characters in `[...` or pattern in `\{...\}`

**escaped characters**  
`\ . . ` : '\\' start insert lines with multiple spaces / tabs  
`\s` : space or tab  
`\t` : tab (GNU sed only)  
`\n` : new line  
`\r` : return  
`$'...\t...\n\r'` : `$` fix `\t` `\n` `\r` character result as `t` `n` `r`  

`$ . * [ ] ^ \` : characters require escape   
