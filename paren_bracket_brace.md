parentheses, brackets, curly braces
---

copied from [stackoverflow](https://stackoverflow.com/a/2188223)  


1. A single bracket `[` usually actually calls a program named `[`; `man test` or `man [` for more info. 
```sh
VARIABLE=abcdef
if [ $VARIABLE == abcdef ] ; then 
    echo yes
else 
    echo no
fi
# yes
```

2. The double bracket `[[` does the same thing (basically) as a single bracket, but is a bash builtin.
```sh
VARIABLE=abcdef
if [[ $VARIABLE == 123456 ]] ; then 
    echo yes
else 
    echo no
fi
# no
```

3. Parentheses `()` are used to create a subshell.
```sh
pwd
/home/user 
(cd /tmp; pwd)
/tmp
pwd
/home/user
```
The subshell allowed performing operations without affecting the environment of the current shell.  
  
4a. Braces `{}` are used to unambiguously identify variables.
```sh
VARIABLE=abcdef
echo Variable: $VARIABLE
# Variable: abcdef
echo Variable: $VARIABLE123456
# Variable:
echo Variable: ${VARIABLE}123456
# Variable: abcdef123456
```

4b. Braces are also used to execute a sequence of commands in the current shell context.
```sh
{ date; top -b -n1 | head ; } >logfile 
# 'date' and 'top' output are concatenated, 
# could be useful sometimes to hunt for a top loader

{ date; make 2>&1; date; } | tee logfile
# now we can calculate the duration of a build from the logfile
```

There is a subtle syntactic difference with `( )`, though (see bash reference). Essentially, a `;` after the last command within braces is a must, and the `{` , `}` must be surrounded by spaces.
