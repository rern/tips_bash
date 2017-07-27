Array
---

```sh
# convert 'string' to 'array' of individual characters
string='abc'
for (( i=0; i < ${#string}; i++ )); do
    array[i]=${string:i:1}
done   # array=(a b c)

# split 'string' to 'array' by a delimiter
string='abc|def|ghi|jk lm'
IFS='|' read -ra array <<< "$string"   # array=(abc def ghi 'jk lm')
# or (spaces in string will make split too)
array=(${string//|/ })   # array=(abc def ghi jk lm)

# insert a character every N interval
echo "abcdefghijklmn" | sed 's/.\{4\}/&|/g'  # abcd|efgh|ijkl|mn

# extract
array=(a b c)
all=${array[*]}     # 'a b c'
all=${array[@]}     # a b c
length=${#array[*]} # 3
value0=$array       # a
value0=${array[0]}  # a
value1=${array[1]}  # b

# edit
array+=('d')              # array=(a b c d)
array[2]=xyz              # array=(a b xyz d)

# partial value
value0to1=${array[@]:0:2} # a b
subvalue2=${array[2]:0:2} # xy

# delete an element
array=( ${array[@]:0:1} ${array[@]:$((1 + 1))} ) # array=(a xyz d)
array=( ${array[@]/xy*/} )                       # array=(a d)

# copy
array2=("${array[@]}") # array2=(a d)


# delete all values in array
array=()    # empty array
unset array # delete array variable
```
