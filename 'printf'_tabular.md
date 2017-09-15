`printf` tabular
---

`%n` : n characters + `s` : string; `d` : digit
```sh
printf "%10s %10d %5s ghi\n" abc 123 def
#        abc        123   def ghi
# 1234567890.1234567890.12345.    <- column width 'n'
```
