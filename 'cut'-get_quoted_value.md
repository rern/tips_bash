Get quoted word

```sh
cut -d '"' -f6 <<<'key1="value1" key2="value2" key3="value3" key4="value4"'
# value3
```
`-d` : delimiter mode  
`'"'` : delimiter character  
`-f6` : field 6  
