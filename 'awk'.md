`awk`
---
in-place: `awk -i inplace `
```sh
# if duplicate in file     -  remove all duplicate lines
awk 'a[$0]++{exit 1}' FILE || awk -i inplace '!seen[$0]++' FILE

# if empty file
[[ $( awk NF FILE ) ]] && echo NOT empty or contains only spaces

# remove blank lines and white spaces lines
awk NF

# replace newline with string
awk 1 ORS='xx'

# concatenate files with a newline in between
awk 1 FILE1.txt FILE2.txt FILE3.txt > files.txt

# get column 3
awk '{print $3}' <<<'column1 column2 column3 column4'
# > column3

# get last column
awk '{print $NF}' <<<'column1 column2 column3 column4'
# > column4

# find matched and get 3rd column to end
awk '/FIND/ {$1=$2=""; print}' <<<'column1 column2 column3 column4'
# > column3 column4

# get 2nd column - substr($0,index($0,$2)) to 2nd from last - NF-=1
awk '{NF-=1;print substr($0,index($0,$2))}' <<<'column1 column2 column3 column4 column5'
# > column2 column3 column4

# get charaters
awk '{print substr($NF, 4, 2)}' 
# > um

# get string between specific delimiter
awk -F 'n' '{print $1}' <<<'column1 column2 column3 column4'
# > colum

# get string between different delimiters
awk -F '[on]' '{print $2}' <<<'column1 column2 column3 column4'
# > lum

# replace multiple spaces with single
awk '{$1=$1};1'

# double blank lines to single
awk -v RS='\n\n' 1

# remove duplicate lines
awk '!a[$0]++'

# get line number 3
awk 'NR==3'
```
