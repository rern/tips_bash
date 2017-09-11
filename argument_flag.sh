#!/bin/bash

string=''
yesno=0

while :; do
	case $1 in
		-s) string=${2:-default}  # =$2 or =default if not defined
			shift;;           # 1st shift
		-y) yesno=1;;             # no 1st 'shift' for option without value
		*) break
	esac
	shift
	# shift 1 out of argument array '$#'
	# 1 flag + 1  value - shift twice
	# 1 flag + '' value - shift once
done

# script.sh -s abc -y x y
echo $string # abc
echo $yesno  # 1
echo $1      # x
echo $2      # y
