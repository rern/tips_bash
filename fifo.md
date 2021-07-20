**fifo / pipe**

1st terminal
```sh
# bash
mkfifo FIFO

while true; do         # wait for any write to FIFO
  while read line; do
    echo $line
  done < FIFO
  echo EOF             # end of each write
done

# python
import os
os.mkfifo( 'FIFO' )

while True:             # wait for any write to FIFO
  with open( 'FIFO' ) as fifo:
    lines = []
    for line in fifo:
      l = line.rstrip() # remove trailing newline
      print( l )
      lines.append( l )
    print( 'EOF' )      # end of each write
```

2nd terminal
```sh
echo DATA > FIFO
```
