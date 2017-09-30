String extract, edit
---

```sh
string='1234567890'
length=${#string}                      # 10
position=$( expr index "$string" '4' ) # 4

# convert 'string' to 'array' of individual characters: array=(1 2 3 4 5 6 7 8 9 0)
string='1234567890'
for (( i=0 ; i < ${#string} ; i++ )); do 
    array[i]=${string:i:1}
done
extract=${array[1]}    # b

# extract
string='1234567890'
${string:1:3}  # 23
${string:0:3}  # 123
${string::3}   # 123
${string: 3}   # 4567890
${string:3}    # 4567890
${string%8*}   # 1234567
${string::-3}  # 1234567
${string:0:-3} # 1234567
${string: -3}  # 890
${string:-3}   # 1234567890 not applicable!!!

# extract word
echo 'aaa   bbb ccc' | awk '{ print $2 }'     # bbb (2nd word - multiple spaces)
echo 'aaa bbb ccc' | cut -d ' ' -f 2          # bbb (< > delimiter)
echo 'key1="aaa" key2="bbb" | cut -d '"' -f 2 # aaa (<"> delimiter)

# edit
string='123456789012345'
${#string}         # 15 - length
${string/123/abc}  # abc456789012345 - replace '123' with 'abc'
${string//123/abc} # abc4567890abc45 - replace all '123' with 'abc'
${string/123}      # 456789045 - delete '123'
${string/123}      # 456789012345 - delete all '123'
${string#3*5}      # 12678901234567890 - delete shortest match '3 to 5'
${string##3*5}     # 1267890 - delete longest match '3 to 5'
${string%3*5}      # 12345678901267890 - delete shortest match '3 to 5' from end
${string%%3*5}     # 1267890 - delete longest match '3 to 5' from end

# non-greedy replace  
perl -pe 's/2(.*?)5/a\1b/' # 1a34b6789012345 - (.*?) : (...)=\1; .=any character *=zero or more; `=shortest  

# squeeze multiple character/spaces to single in string / file
echo 'a b  c  d' | tr -s ' ' # a b c d
tr -s ' ' < file

# delete characters from string / file
echo 'a b  c  d' | tr -d ' ' # abcd
tr -d ' ' < file

# extract only number / non-number
numstring=1.23ab
${numstring//[^0-9.]/} # 1.23 - '//'delete all characters '^'not match '[...]'any of '0 to 9'
${numstring//[0-9.]/}  # ab - '//'delete all characters match '[...]'any of '0 to 9'

# extract float number
float=1.23
${float%.*}   # 1 (round down) - '%'delete from end '*'all characters to 1st '.' matched
${float#.*}   # 23 - '#'delete from start '*'all characters to 1st '.' matched

# extract space-separated words
$( awk '{print $4}' <<<'column1 column2 column3 column4' )     # column4
$( awk '{print $NF}' <<<'column1 column2 column3 column4' )    # last column

# convert case
string=abc
=${$string^^}    # ABC - uppercase

string=ABC
${$string,,}     # abc - lowercase
```
