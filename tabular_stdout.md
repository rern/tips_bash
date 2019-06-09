Tabular stdout
---

**`column`**
```sh
string='
abc 123 def
pqrst 45678 vwxyz
'
echo "$string" | column -t -s' ' -R2

# abc      123   def
# pqrst  45678   vwxyz
```
 
**`printf`**  
`%-n` : n characters  
`%n` : n characters align right  
`s` : string  
`d` : only leading digits  
```sh
printf "%-5s %10d %s\n" abc 123 def
# abc          123   def
# 12345.1234567890.12345  <- column width 'n'
```
