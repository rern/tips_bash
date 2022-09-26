Array
---
```sh
# new array - delimiter 'space'
array=(a b c)
array=( $( echo "$lines" ) ) # no spaces in each line

# count element
count=${#array[@]}

# indexes of array
index=${!array[@]} # index=(0 1 2)

# append array (no need to define array prior to append)
array+=(d)

# create associative array
declare -A array=( [a]=aa [b]=bb [c]=cc )
array[d]=dd
array_a=${array[a]}

# get all keys of associative array
keysarray=( $( echo "${!array[@]}" | tr ' ' '\n' | sort ) )

# lines with single word, contain no spaces, in each line can be loop directly
lines='aaa
bbb
ccc'
for line in $lines; do
    echo $line
done

# create array from file
readarray -t array < $file

# convert 'stdout' to 'array' - delimiter '\n'
readarray -t array <<< $( command ) # from var - readarray -t array <<< "$var"
for line in "${array[@]}"; do
    echo $line
done

# convert 'array' to 'multiline string'
string=$( printf "%s\n" "${array[@]}" )

# split 'string' to 'array' by a delimiter
string='abc|def|ghi|jk lm'
IFS='|' read -ra array <<<"$string"   # array=(abc def ghi 'jk lm')
# or (spaces in string will make split too)
array=(${string//|/ })   # array=(abc def ghi jk lm)

# insert a character every N interval
echo "abcdefghijklmn" | sed 's/.\{4\}/&|/g'  # abcd|efgh|ijkl|mn

# extract
array=(a b c)
all=${array[*]}     # 'a b c' (single word)
all=${array[@]}     # a b c   (individual words)
length=${#array[*]} # 3
value0=$array       # a
value0=${array[0]}  # a
value1=${array[1]}  # b
last=${array[-1]}   # c
value0to1=${array[@]:0:1}
valueexcept1=${array[@]:1}
valueafter1=${array[@]:2}
valuelast=${array[@]: -1}

# add
array+=(d)                 # array=(a b c d)
array[2]=xyz               # array=(a b xyz d)

# partial value
value0to1=${array[@]:0:2}  # a b
subvalue2=${array[2]:0:2}  # xy

# copy
array2=("${array[@]}")     # array2=(a d)

# delete an element
array=(a b c d)
unset 'array[1]'           # array=(a c d) - delete by index
unset 'array[-1]'          # array=(a b c) - delete last element

# reset index
array=(a xyz '' d)
array=("${array[@]}")      # array=(a xyz d)
array=("${array[@]/xy*/}") # array=(a d)     - pattern match + reser index

# delete all values in array
array=()                   # empty array
unset array                # delete array variable

# sort
IFS=$'\n' sorted=( $( echo "${array[*]}" | sort ) )
unset IFS
```
