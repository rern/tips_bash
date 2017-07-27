echo
---

`"..."` double quote should be used in general  
`'...'` single quote only when to force everything literal

**Escape character**  
``\\, \", \$, \`, \(, \), \[, \], \#, \*, \|, \;`` (or within `' '`)  
`'&', '<', '>'` (cannot use `\`)  
`'...'\''...'` escaped `\'` must be outside single quotes  

`echo ...` : non quote - reserve characters must be escaped, `'&'` must use single quoted   
`echo "..."` : weak quote - translate variables, no escapes required  
`echo '...'` : strong quote - all literal  

`echo` : blank line  
`echo $var` : var value - multi words  
`echo "$var"` : var value - single word  
`echo '$var'` : $var literal  
`echo $var abc` : concatenate var value and string  
`echo 'abc "def"'` : double quote 
`echo "$var \"abc\""` : escaped double quote inside double quote  
`echo ${var}abc` or `echo -e "$var \babc"` : var next to string without space  
`echo -n "abc"` : `-n` = no new line  
`echo -e "\nabc\n"` : `-e` = enable translate backslash characters  
```
    \a          alert (bell)  
    \b          backspace
    \c          suppress trailing new line
    \e          escape 
    \f          form feed
    \n          new line
    \r          carriage return
    \t          horizontal tab
    \v          vertical tab
    \\          backslash
    \NNN        character - ASCII code in octal
    \xnnn       character - ASCII code in hexadecimal
```
`echo abc > file`  : create new file or **replace** if file exist with 'abc' content  
`echo abc >> file` : create new file or **append**  if file exist with 'abc' content    
