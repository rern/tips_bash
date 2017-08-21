sed
---
`$ . * [ ] ^ \` : characters require escape (only in regex)  

**flags**  
`-i` : **i**n-place edit file  
`-i '.bak'` : **i**n-place edit file with backup `file.bak`  
`-e` : **e**xpressions in sequence  
`-n` : li**n**e indication  

**variables / quotes**  
`$'/...\'...\'.../'` : `$` + escaped `'` inside single quote  
`'/...\x27...\x27.../` : `'` hex character  
`"/...\"...\".../"` : escaped `"` inside double quote  
`'/...\x22...\x22.../` : `"` hex character  
`"/...$var.../"` : variable inside double quotes  
`'/...'$var'.../'` : variable outside quotes  

**search address**  
string / line number / regex  

**commands**  
`'/.../ i\ ...'` : `i` **i**nsert before line matched (`\` needed for escaped every new line)  
`'/.../ a\ ...'` : `a` **a**ppend after line matched (`\` needed for escaped every new line)  
`'/.../ r <file>` : `r` **r**ead file to append after line matched  
`'/.../ d` : `d` **d**elete line matched  
`-n '/.../ p` : `p` **p**rint line matched  
`'s/.../.../'` : substitute 1st matched (delimiter can be any symbol or character)  

**multiple commands**  
```sh
sed '/.../ {s/.../.../; s/.../.../}' file
# or
sed '/.../ {
s/.../.../
s/.../.../
}
' <file>
```

**line operations** (all matched)  
\* `<x>` : `i`, `a`, `d`, `p`, `r`  
\* `<n>` : number  

`-n '/.../p'` : **p**rint line string by matched  
`'<n>q;d'` : get line string by line number  
`-n '/.../='` : get line number 

`/.../ <x>` : line matched (left escaped delimiter `\|` for `\|...|`)  
`'/^.../'` : `^` line start with  
`/...$/` : `$` line end with  
`/^$/` : blank line  
`'<n> <x>'` : \<n\>th line  
`'1 <x>'` : 1st line  
`'$ <x>'` : last line  
`'/^\s*$/ <x>'` : all blank lines  

`/<1st>/, /<last>/ <x>` : line matched range  
`/.../, +<n> <x>` : line range from matched to next \<n\> line  
`q` : print 1st line (then **q**uit)  
`<n>q` : print 1st to \<n\>th line  

`'0,/.../{//d}'` : delete only 1st matched line (1st line to matched range)  
`'/.../{N; <x>}'` : line matched includes **N**ext line  
`'/.../{n; <x>}'` : line **n**ext to matched  
`'/.../{n;n; <x>}'` : 2nd line **n**ext to matched  
`$(( $( sed -n '/.../=' $file ) - <n> ))' <x>'` : \<n\> line prior to matched  

**string operations**   
alternative: [simple brace expansion](https://github.com/rern/tips/blob/master/bash/string_extract_edit.md)  
`'s/a.../b.../'` : `s` **s**ubstitute 1st matched `a...` with `b...`  
`'s/a.../b.../<n>'` : substitute \<n\>th matched   
`'s/a.../b.../g'` : `g` **g**lobal - substitute all  
`'s/a.../b.../i'` : `i` case **i**nsensitive  
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

**regex list**  
`'/[...]/'` : any characters in `[...]`  
`'/[^...]/'` : `[^` not any characters in `...]`  
`'/[^ ]*/'` : `*` zero or more characters that `^` are not space  
`'/^[...]/'` : start with any character in `[ ]`  
`'/[...]$/'` : end with any character in `[ ]`  
`'/a...\|b.../ <x>'` : string `a...` or `b...` (`\` needed for escaped `|`)  

**mixed regex**  
`'/[...]\|.../'` : any characters in `[...]` or pattern `...` (`\` needed for escaped `|`)  
`'[^...\{...\}]$'` : `[^` not `$` end with any characters in `[...` or pattern in `\{...\}`

**escaped new lines**  
`...\` : escaped new lines within single quote  
`...\\` : escaped new lines within double quote (escaped backslash `\`)  

**escaped characters**  
`\ . . ` : '\\' start insert lines with multiple spaces / tabs  
`\s` : space or tab  
`\t` : tab (GNU sed only)  
`\n` : new line  
`\r` : return  
`$'...\t...\n\r'` : `$` escapes `\t` `\n` `\r` to  `t` `n` `r`    
