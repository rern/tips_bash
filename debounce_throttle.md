### Debounce
- hold 0.5 second
- reset to 0.5 on every new call
- run on 0.5 reached
- non-blocking
```sh
echo 5 > flagfile                   # newcall
( for (( i=0; i < 5; i++ )); do
	sleep 0.1                       # duration between each call
	s=$(( $( cat flagfile ) - 1 ))
	(( $s == 4 )) && i=0            # new call - reset count
	if (( $s > 0 )); then
		echo $s flagfile
	else
		COMMAND1
		COMMAND2
		rm -f flagfile
	fi
done ) &> /dev/null &

```

### Throttle
- allow only last run within 1 seconds (wait > run)
```sh
# non-blocking
if [[ ! -e flagfile ]]; then
	touch flagfile
	(
		sleep 1 #####
		
		COMMAND1
		COMMAND2
		rm -f flagfile
	) &
fi

# within while loop
if [[ ! -e flagfile ]]; then
	touch flagfile
	sleep 1 #####
	
	COMMAND1
	COMMAND2
	rm -f flagfile
fi
```
