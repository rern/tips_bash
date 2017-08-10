#!/bin/bash

# Download multiple-parts *.ts files to a single file

# chrome <right-click> inspect > network
# play the movie
# network > find *.ts (type: xhr) <right-click> copy > Copy link address
# forward to end to get the last 'N' for 'total'

# this file
# edit /-1-/-$i-/ in: url0=$( echo $url | sed "s/-1-/-$i-/" )

# run ./ts.sh 

name='The Farthest.ts'
dir=/mnt/hdd/Movies
url=https://s36.gtsznokiyn.site/hls/qvsbfgdmnxblgwsztrd2a7wllpqmmlgeg7ovili7hdfaoj2psgrrjqldzkca/seg-1-v1-a1.ts
total=5

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
  yesno "Overwrite existing $dir/\e[36m$name\e[0m:" ans
  [[ $ans != 1 ]] && exit
  rm "$dir/$name"
fi

time0=$( date +%s )

mkdir -p $dir

echo -e "\n$dir/\e[36m$name\e[0m\n"

for (( i = 1; i <= $total; i++ )); do
	url0=$( echo $url | sed "s/-1-/-$i-/" )
	echo $i/$total
	wget -q --show-progress --tries=10 --retry-connrefused --timeout=2 --wait=1 $url0 -O - >> "$dir/$name"
done

time1=$( date +%s )
timediff=$(( $time1 - $time0 ))
timemin=$(( $timediff / 60 ))
timesec=$(( $timediff % 60 ))
echo -e "\n$dir/\e[36m$name\e[0m downloaded in $timemin min $timesec sec\n"
