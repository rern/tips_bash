#!/bin/bash

while (( i < 5 )); do
	(( i++ ))
	echo $i
	sleep 1
done

while read line; do
	echi $line
done <<< "$lines"

while read line; do
	echi $line
done < $file

while read line; do
	echi $line
done < <( command )
