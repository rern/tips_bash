#!/bin/bash

# Download multiple-parts *.ts files to a single file

# chrome <right-click> inspect > network
# play the movie
# network > find *.ts (type: xhr) <right-click> copy > Copy link address
# forward to end to get the last 'N' for 'total'

# this file
# edit increment pattern /-1-/-$i-/ in: url=$( echo $url1 | sed "s/-1-/-$i-/" )

# run ./ts.sh 

name='The Farthest.ts'
dir=/mnt/hdd/Movies
url1=https://s36.gtsznokiyn.site/hls/qvsbfgdmnxblgwsztrd2a7wllpqmmlgeg7ovili7hdfaoj2psgrrjqldzkca/seg-1-v1-a1.ts
total=3

li=$( printf "\e[36m%*s\e[0m\n" "${COLUMNS:-$(tput cols)}" '' | tr ' ' "=" )
bar='\e[36m\e[46m . \e[0m'
yesno() { # $1 = header string; $2 = input or <enter> = ''
	echo
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

echo $li
echo -e "$bar $dir/\e[36m$name\e[0m"
echo $li

for (( i = 1; i <= $total; i++ )); do
	url=$( echo $url1 | sed "s/-1-/-$i-/" )
	echo $i/$total
	wget -q --show-progress --tries=10 --retry-connrefused --timeout=2 --wait=1 $url -O - >> "$dir/$name"
done

time1=$( date +%s )
dif=$(( $time1 - $time0 ))
min=$(( $dif / 60 ))
(( ${#min} == 1 )) && min=0$min
sec=$(( $dif % 60 ))
(( ${#sec} == 1 )) && sec=0$sec

echo $li
echo -e "$bar $dir/\e[36m$name\e[0m downloaded in ${min}:$sec"
echo $li
