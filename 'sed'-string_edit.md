sed
---
Default:
- Search line: Process all lines - limit by range `/a.../,/b.../ <x>`
- Search string: Process all lines but only 1st matched of each line - global match by `s/a.../b.../g`
- Search 1st matched string only: `0,/.../ s/a.../b.../`

**regex reserved characters**  
`. ^ $ * + ? ( ) [ { \ |` - use literally must be escaped  
  
  
**variables / quotes**  
`$'/...\'...\'.../'`   : `$` + escaped `'` inside single quote (or use `.` wildcard if posible)  
`'/...\x27...\x27.../` : `'` hex character  
`"/...\"...\".../"`    : escaped `"` inside double quote  
`'/...\x22...\x22.../` : `"` hex character  
`"/...$var.../"`       : variable inside double quotes  
`'/...'$var'.../'`     : variable outside quotes  

**search address**  
string / line number / regex  

**flags**  
`-i`        : **i**n-place edit file  
`-i '.bak'` : **i**n-place edit file with optional backup `file.bak`  
`-e`        : **e**xpressions in sequence  
`-n`        : li**n**e indication  

**commands**  
`'/.../ i\ ...'`  : `i` **i**nsert before line matched (`\` needed for escaped every new line)  
`'/.../ a\ ...'`  : `a` **a**ppend after line matched (`\` needed for escaped every new line)  
`'/.../ r <file>` : `r` **r**ead file to append after line matched  
`'/.../ d`        : `d` **d**elete line matched  
`-n '/.../ p`     : `p` **p**rint line matched  
`'s/.../.../'`    : substitute 1st matched (delimiter can be any symbol or character)  

**comments**  
- between each command, the end of lines or between lines
- not inside new insert/replace string  

**multiple commands**  
`;` : new line
`\` : escaped new line (**includes blank lines**, optional last line) 
```sh
sed 's/.../.../; s/.../.../' file         # optional {...}
sed '/.../ {s/.../.../; a\...\n...}' file # required {...}
# or
sed '/.../ { # comment
# comment
s/.../.../   # comment
a\
...\
\
...
}
' <file>
``` 

**line operations** (all matched)  
(first matched line only)  
\* `<x>`           : `i`, `a`, `d`, `p`, `r`  
\* `<n>`           : number    
`/.../`            : default delimiter  
`\|...|`, `\#...#` : delimiters can be any (but in range search, none default `/` must be escaped)  
  
`-n '/.../p'`      : **p**rint line string by matched  
`'<n>q;d'`         : get line string by line number  
`-n '/.../='`      : get line number 

`/.../ <x>`        : line matched (left escaped delimiter `\|` for `\|...|`)  
`'/^.../'`         : `^` line start with  
`/...$/`           : `$` line end with  
`/^$/`             : blank line  
`'<n> <x>'`        : \<n\>th line  
`'1 <x>'`          : 1st line  
`'$ <x>'`          : last line  
`'/^a.*b$/ <x>'`   : start with `a` and end with `b`  
`'/^\s*$/ <x>'`    : blank lines  

`/<1st>/, /<last>/ <x>` : matched line range  
`'0,/<last>/ <x>'`      : `0` to 1st matched line range (for limit only 1st occurrence)  
`/.../, +<n> <x>`       : line range from matched to next \<n\> line  
`/a...\|b...\|c.../ <x>`: line matched or `\|` (between `/` only)  
`q` : print 1st line (then **q**uit)  
`<n>q` : print 1st to \<n\>th line  
  
`'/.../{N; <x>}'`   : line matched includes **N**ext line (for `i`, `a`)  
`'/.../{n; <x>}'`   : line **n**ext to matched  
`'/.../{n;n; <x>}'` : 2nd line **n**ext to matched  
`$(( $( sed -n '/.../=' $file ) - <n> ))' <x>'` : \<n\> line prior to matched  

`sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba'` : remove all trailing new lines  
`sed -i -e '$a\'` : add a trailing new line if not exist  

**string operations**  
`/.../`   : word  
`/[...]/` : character  
`s/.../.../`,  `s|...|...|`,`s#...#...#` : delimiter (no escape needed)  
all lines - first matched string of each line unless with `g`  
non-greedy match : use `perl`
alternative: [simple brace expansion](https://github.com/rern/bash_tips/blob/master/string_extract_edit.md)  
  
`'s/a.../b.../'`      : `s` **s**ubstitute 1st matched `a...` with `b...`  
`'s/a.../b.../<n>'`   : substitute \<n\>th matched   
`'s/a.../b.../g'`     : `g` **g**lobal - substitute all **in that line**  
`'0,/a.../ s/a.../b.../'` : substitute only first matched (range line 1 to matched)  
`'s/a.../b.../i'`     : `i` case **i**nsensitive   
`'/^a.../ s/^/b.../'` : prepend `b...` to the `^` begining of line start with `a...`  
`'/^a.../ s/$/b.../'` : append `b...` to the `$` end of line start with `a...`  
  
`'s/a.../&b.../'`     : reuse input as `&` = `a...b...`  
`'s/a.../b...&/'`     : `b...a...`  
`'s|--\(aaa\)--\(bbb)--|==\1\2==|'` : reuse input parts `\(...\)` as `\n`, `--aaa--bbb--` to `==aaabbb==`  

**wildcards**  
`.`  : single character or space wildcard  
`.*` : multiple character wildcard  
`\?` : 0 or 1 of preceding character  
`\+` : 1 or more of preceding character  
`*`  : 0 or more of preceding character  

**regex list**  
`'/[...]/'`          : any characters in `[...]`  
`'/[^...]/'`         : `[^` not any characters in `...]`  
`'/[^ ]*/'`          : `*` zero or more characters that `^` are not space  
`'/^[...]/'`         : start with any character in `[ ]`  
`'/[...]$/'`         : end with any character in `[ ]`  
`'/a...\|b.../ <x>'` : string `a...` or `b...` (`\` needed for escaped `|`)  

**mixed regex**  
`'/[...]\|.../'` : any characters in `[...]` or pattern `...` (`\` needed for escaped `|`)  
`'[^...\{...\}]$'`   : `[^` not `$` end with any characters in `[...` or pattern in `\{...\}`

**escaped new lines**  
`...\`  : escaped new lines within single quote  
`...\\` : escaped new lines within double quote (escaped backslash `\`)  

**escaped characters**  
`\s` : space or tab  
`\t` : tab (GNU sed only)  
`\n` : new line  
`\r` : return  
`$'...\t...\n\r'` : `$` escapes `\t` `\n` `\r` to  `t` `n` `r`    
