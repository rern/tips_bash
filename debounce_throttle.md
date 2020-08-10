### Debounce
- allow only 1st run within 1 seconds (run > wait)

```sh
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
if [[ ! -e flagfile ]]; then
	touch flagfile
	sleep 1 #####
	
	COMMAND1
	COMMAND2
	rm -f flagfile
fi
```