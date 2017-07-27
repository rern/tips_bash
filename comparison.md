Comparison
---

`[[ ... ]]` needs white spaces (`[` or `[[` are commands) 
`(( ... ))` with or without white spaces  

(`[[ ... ]]` and `(( ... ))` are BASH specific)  

**Logic**  
`(( 0 ))` : false / exit 1  
`(( 1 ))` : true / exit 0  

**String**  
`[[ $a == $b ]]` or `[[ $a = $b ]]`  
`[[ $a == [0-9]` : equal range `0-9`  
`[[ $a != $b ]]`  
`[[ $a != [0-9]` : not equal range `0-9`  
`[[ $a > $b ]]`  
`[[ $a < $b ]]`  
`[[ -z $a ]]` : null / zero length  
`[[ -n $a ]]` : not null 

**Integer**  
`[[ $a -eq $b ]]` or `(( $a == $b ))` ( but `(( $a = $b ))` set variable )  
`[[ $a -ne $b ]]` or `(( $a != $b ))`  
`[[ $a -gt $b ]]` or `(( $a > $b ))`  
`[[ $a -ge $b ]]` or `(( $a >= $b ))`  
`[[ $a -lt $b ]]` or `(( $a < $b ))`  
`[[ $a -le $b ]]` or `(( $a <= $b ))`   

**File**  
`[[ -e filedirlink ]]` : exist  
`[[ -f file ]]` : 'file' exist  
`[[ -d directory ]]` : 'directory' exist  
`[[ -L link ]]` : 'link' exist  
