`awk` get word by column number
---

```sh
# get column 3
awk '{print $3}' <<<'column1 column2 column3 column4'
# > column3

# get last column
awk '{print $NF}' <<<'column1 column2 column3 column4'
# > column4

# remove blank lines
awk NF
# or
grep .

# remove duplicate lines
awk '!a[$0]++'

# get line number 3
awk 'NR==3'
```
