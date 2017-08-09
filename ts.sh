#!/bin/bash

# Download multiple-parts *.ts files to a single file
# chrome <right-click> inspect > network
# play the movie
# network > find *.ts (type: xhr) <right-click> copy > Copy link address
# forward to end to get the last 'N'

# this file
# replace 'https://...' with copied address
# edit 'N' > {1..N}, directory, filename

# run ./ts.sh 

url=https://s16.openstream.io/hls/qvsbe6etnpblgwsztq3kap62j7azw4e5mfbl5pcvv2gl472at67qop7z2qfa/seg-{1..200}-v1-a1.ts
name='Flesh And Bone S01E08.ts'
dir='/mnt/hdd/Movies/Flesh And Bone 1'
file="$dir/$name"

time0=$( date +%s )

mkdir -p $dir

yesno() { # $1 = header string; $2 = input or <enter> = ''
	echo -e "$1"
	echo -e '  \e[0;36m0\e[m No'
	echo -e '  \e[0;36m1\e[m Yes'
	echo
	echo -e '\e[0;36m0\e[m / 1 ? '
	read -n 1 $2
	echo
}
if [[ -e "$file" ]]; then
  yesno "\e[30m\e[43m i \e[0m Overwrite existing $file:" ans
  [[ $ans != 1 ]] && exit
  rm $file
fi

echo -e "\n$file\n"
wget -q --show-progress --tries=10 --retry-connrefused --timeout=2 --wait=1 "$url" -O - >> "$file"

time1=$( date +%s )
timediff=$(( $time1 - $time0 ))
timemin=$(( $timediff / 60 ))
timesec=$(( $timediff % 60 ))
echo -e "\nDuration: $timemin min $timesec sec"
