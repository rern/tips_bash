### Debounce
- allow only 1st run within 0.05 seconds

```sh
if [[ ! -e flagfile ]]; then
	touch flagfile
	( sleep 0.05 && rm -f flagfile ) &
	COMMAND1
	COMMAND2
fi
```

### Throttle
- allow only last run within 0.05 seconds
```sh
if [[ ! -e flagfile ]]; then
	touch flagfile
	( sleep 0.05 && rm -f flagfile
		COMMAND1
		COMMAND2
	) &
fi
```
