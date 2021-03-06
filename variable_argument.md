variable, argument
---

`$var` : simplified `${var}`  
`var=` `var=''`       : empty variable  
- `[[ -z $var ]]`     = true
- `[[ -z ${var+x} ]]` = false (true if var was not set)  

`command a b c d e`  

`$#` : number of argument = 5  
`$@` : all arguments      = a b c d e  
`$0` : command itself     = command  
`$1` : Nth argument       = a    
`${@:$#}` : last argument = e  
`${@:(-2):1}` : 2nd last  = d

`$?` : last exit code  

`$*` `$@` `"$@"` : all arguments as separated words   
`"$*"` : all arguments as a single word  

`"${array[@]}"` : all value as separated words  
`"${array[*]}"` : all arguments as a single word  

`eval {...$var}` : var inside culrly braces   

`eval $arg=$var` : assign argument as variable name  

**heredoc to avoid escape**  
```sh
read -r -d '' var <<'EOF'
any characters, quotes, slashs, symbols
can be used without escape
EOF
```

**variable value as variable name**
```sh
a=b
declare $a=c  # b=c : use value of $a as new variable name
echo $b       # c
```

**indirect variable**
```sh
a=b
c=a
echo $c      # a
echo ${!c}   # b - expand ${!c} as $a
```

**previous command with arguments**
```sh
trap 'previouscmd=$thiscmd; thiscmd=$BASH_COMMAND' DEBUG
command arg1 arg2
prev=$previouscmd   # prev='command arg1 arg2'
```
