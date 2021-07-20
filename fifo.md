**fifo / pipe**

1st terminal
```sh
# create named pipe
mkfifo FIFO

# wait for any write to FIFO
while true; do
  while read line; do
    echo "$line"
  done < FIFO
done

# python
import os

FIFO = 'FIFO'
os.mkfifo( FIFO )
while True:
  with open( FIFO ) as fifo:
    for line in fifo:
      print( line )
```

2nd terminal
```sh
echo DATA > FIFO
```
