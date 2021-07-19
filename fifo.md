**fifo / pipe**

1st terminal
```sh
# create named pipeline
mkfifo PIPE

# wait to read any write to PIPE
while true; do
  while read line; do
    echo "$line"
  done < PIPE
done
```

2nd terminal
```sh
echo DATA > PIPE
```
