#!/bin/bash

i=0

while (( i < 50 )); do
	i=$(( $i + 1 ))
	echo $i
	sleep 0.1
done
