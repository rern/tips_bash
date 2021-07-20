**fifo / pipe**

1st terminal
```sh
# bash
mkfifo FIFO

while true; do # wait for any write to FIFO
  while read line; do
    echo "$line"
  done < FIFO
done

# python
import os
os.mkfifo( 'FIFO' )

while True: # wait for any write to FIFO
  with open( 'FIFO' ) as fifo:
    for line in fifo:
      print( line.rstrip() ) # remove trailing newline
	print( 'EOF' )
```

2nd terminal
```sh
echo DATA > FIFO
```
