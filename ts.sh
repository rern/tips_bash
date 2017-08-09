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

name='The Farthest.ts'
dir='/mnt/hdd/Movies'

yesno() { # $1 = header string; $2 = input or <enter> = ''
	echo -e "\e[30m\e[43m i \e[0m $1"
	echo -e '  \e[0;36m0\e[m No'
	echo -e '  \e[0;36m1\e[m Yes'
	echo
	echo -e '\e[0;36m0\e[m / 1 ? '
	read -n 1 $2
	echo
}
if [[ -e "$dir/$name" ]]; then
  yesno "Overwrite existing $dir/$name:" ans
  [[ $ans != 1 ]] && exit
  rm $dir/$name
fi

time0=$( date +%s )

mkdir -p $dir

echo -e "\n$dir/$name\n"
wget -q --show-progress --tries=10 --retry-connrefused --timeout=2 --wait=1 \
https://s36.gtsznokiyn.site/hls/qvsbfgdmnxblgwsztrd2a7wllpqmmlgeg7ovili7hdfaoj2psgrrjqldzkca/seg-{1..291}-v1-a1.ts -O - >> "$dir/$name"

time1=$( date +%s )
timediff=$(( $time1 - $time0 ))
timemin=$(( $timediff / 60 ))
timesec=$(( $timediff % 60 ))
echo -e "\nDuration: $timemin min $timesec sec"
