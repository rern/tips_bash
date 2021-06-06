### Debounce
- wait 0.5 seconds and reset to 0.5 every new bounce
```sh
# non-blocking
echo 5 > flagfile # 5 x 0.1 = 0.5 s
(
	for (( i=0; i < 5; i++ )); do
		sleep 0.1
		s=$(( $( cat flagfile ) - 1 ))
		if (( $s > 0 )); then
			echo $s > flagfile
		else
			rm -f flagfile
			COMMAND1
		fi
	done
) &> /dev/null &
```
- allow only 1st run within 1 seconds (run > wait)

```sh
# non-blocking
if [[ ! -e flagfile ]]; then
	touch flagfile
	(
		COMMAND1
		COMMAND2
		sleep 1 #####

		rm -f flagfile
	) &
fi

# within while loop
if [[ ! -e flagfile ]]; then
	touch flagfile
	COMMAND1
	COMMAND2
	sleep 1 #####
	
	rm -f flagfile
fi
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
