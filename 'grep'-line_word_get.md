**grep** - word  

Get a word by characters
```sh
grep -o 'key3[^ ]*' <<<'key1="value1" key2="value2" key3="value3" key4="value4"'
# key3="value3"
```
Get value by key from string multiline or file
```sh
grep -Po 'key3=\K[^ ]+' <<<'key1=value1 key2=value2 key3=value3 key4=value4'
# value3
```
`key3=` : key  
`\K` : discard matched part  
`[^ ]+` : get value (limit with next space)  

Get line
```sh
grep "text to find" file.ext
# text to find
```

Get line number
```sh
grep -n "text to find" file.ext | cut -f1 -d:
# line number
```
