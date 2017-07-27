Redis - dump data / json to a file
---
```sh
pip install redis-dump-load

python
>>> import redisdl
>>> redisdl.dump( open('data.json', 'w') )
# output file: data.json
```
