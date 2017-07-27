#!/bin/bash

# password promt funtion
# set password variable as '$pwd1'

[[ -z $info ]] && info=$( echo -e "\e[38;5;0m\e[48;5;3m i \e[0m" )

setpwd() {
	echo 'Password: '
	read -s pwd1
	echo
	echo 'Retype password: '
	read -s pwd2
	echo
	if [[ $pwd1 != $pwd2 ]]; then
		echo
		echo "$info Passwords not matched. Try again."
		setpwd
	fi
}
