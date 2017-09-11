#!/bin/bash

string=''
yesno=0

while :; do
	case $1 in
		-s) [[ $2 != 0 ]] && string=$2
			shift;;                # 1st shift
		-y) yesno=1;;                  # no 1st 'shift' for option without value
		*) break
	esac
	shift
	# shift 1 out of argument array '$#'
	# 1 flag + 1  value - shift twice
	# 1 flag + '' value - shift once
done

echo $string # 'np -s' = ''; '-s string' = string
echo $yesno  # 'no -y' = 0;  '-y'        = 1
