Array
---
```sh
# new array
array=(a b c)

# count element
count=${#array[@]}

# indexes of array
index=${!array[@]} # index=(0 1 2)

# append array (no need to define array prior to append)
array+=(d)

# create associative array
declare -A array=( [a]=aa [b]=bb [c]=cc )
array[d]=dd

# lines with single word, contain no spaces, in each line can be loop directly
lines='aaa
bbb
ccc'
for line in $lines; do
    echo $line
done

# convert 'lines of string' to 'array' (delimiter: newline)
readarray -t array <<<"$lines"  #   literal \n must be: array=( echo -e "$lines" )
for line in "${array[@]}"; do
    echo $line
done

# create array from file
mapfile -t array < $file

# convert 'stdout' to 'array' by 'line'
array=( $( command ) ) # array=( line1 line2 line3 ... )

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
last=${@:$#}        # c

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

# sort
IFS=$'\n' sorted=( $( echo "${array[*]}" | sort ) )
unset IFS
```
