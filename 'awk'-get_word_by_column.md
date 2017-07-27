`awk` get word by column number
---

```sh
awk '{print $3}' <<<'column1 column2 column3 column4'
# column3

awk '{print $NF}' <<<'column1 column2 column3 column4'
# column4 ('$NF' = last column)
```
