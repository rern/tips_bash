`awk` get word by column number
---

```sh
# concatenate files with a newline in between
awk 1 file1.txt file2.txt file3.txt > files.txt

# get column 3
awk '{print $3}' <<<'column1 column2 column3 column4'
# > column3

# get last column
awk '{print $NF}' <<<'column1 column2 column3 column4'
# > column4

# find matched and get 3rd column to end
awk '/FIND/ {$1=$2=""; print}' <<<'column1 column2 column3 column4'
# > column3 column4

# get charaters
awk '{print substr($NF, 4, 2)}' 
# > um

# get string between different delimiters
awk -F '[on]' '{print $2}' <<<'column1 column2 column3 column4'
# > lum

# remove blank lines
awk NF
# or
grep .

# double blank lines to single
awk -v RS='\n\n' 1

# remove duplicate lines
awk '!a[$0]++'

# get line number 3
awk 'NR==3'
```
