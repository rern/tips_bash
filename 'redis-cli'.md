Redis basic commads
---

complete [**data types**](https://redis.io/topics/data-types)  
complete [**commands**](https://redis.io/commands)  

`redis-cli` : interractive shell  
`redis-cli command ...` : syntax  

`keys *` : list all keys  
`type key` : get type of key  

`var=$( redis-cli get key )` - already null stdout ( if `&> /dev/null` > $var == `null` )
**string**  
`set key value` : set value of key  
`get key` : get value of key  

**hash**  
`hset key name value` : set value of name in key  
`hmset key name value name1 value1` : set values of multiple names in key  
`hget key name` get value of name in key  
`hgetall key` : get all name:value pairs in key
`hdel key name` : delete a hash  

**set**  
`mset key value` : set value of key  
`mget key` : get value of key  

**list**  
`keys "*"` : list all keys
`lpush key value value1` : insert values to the left of key  
`rpush key value value1` : insert values to right of key  
`lindex key index` : get value at index of key  
`llen key` : get length of key  
`lpop key` : get value and delete from the Left of key  
`rpop key` : get value and delete from the right of key  

**delete**  
`del key` : delete key (all types)  
`redis-cli --scan --pattern 'abc*' | xargs redis-cli del` : delete by wildcard

**backup / restore**
```sh
### backup
redis-cli get config dir           # saved directory
redis-cli save                     # save latest database
cp /var/lib/dump.rdb /destination  # copy database

### restore
systemctl stop redis
mv /var/lib/redis/dump.rdb{,.backup}
cp /destination/dump.rdb /var/lib/redis
systemctl start redis
```

**copy hash**  
bash: `hgetall` > array > for loop
```sh
defaultIFS=$IFS                        # save default IFS
IFS=$'\n'                              # set IFS
hash0=( $( redis-cli hgetall hash0 ) ) # get hash > split to array by IFS'\n'
IFS=$defaultIFS                        # restore IFS

ilength=${#hash0[@]}
for (( i = 0; i < $ilength; i+=2 )); do                  # loop hset
    redis-cli hset hash1 "${acards[i]}" "${acards[i+1]}" 
done
```
PHP: `hgetall` > foreach loop 
```php
$redis = new Redis(); 
$redis->pconnect( '127.0.0.1' );

$hash0 = $redis->hGetAll( 'hash0' );
foreach ( $hash0 as $key => $value ) {
    $redis->hSet( 'hash1', $key, $value );
}
```

**convert key:value to value:key**
```sh
keyvalue=$( redis-cli hgetall hash )
readarray -t array <<<"$keyvalue"
ilength=${#array[*]}
for (( i=0; i < ilength; i+=2 )); do
    redis-cli hset newhash "${array[i+1]}" "${array[i]}" &> /dev/null
done
```

