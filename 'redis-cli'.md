Redis basic commads
---

complete [**data types**](https://redis.io/topics/data-types)  
complete [**commands**](https://redis.io/commands)  

`redis-cli` : interractive shell  
`redis-cli command ...` : syntax  

`keys *` : list all keys  
`type key` : get type of key  

**string**  
`set key value` : set value of key  
`get key` : get value of key  

**hash**  
`hset key name value` : set value of name in key  
`hmset key name value name1 value1` : set values of multiple names in key  
`hget key name` get value of name in key  
`hgetall key` : get all name:value pairs in key  

**set**  
`mset key value` : set value of key  
`mget key` : get value of key  

**list**  
`lpush key value value1` : insert values to the left of key  
`rpush key value value1` : insert values to right of key  
`lindex key index` : get value at index of key  
`llen key` : get length of key  
`lpop key` : get value and delete from the Left of key  
`rpop key` : get value and delete from the right of key  
