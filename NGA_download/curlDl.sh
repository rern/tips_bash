#!/bin/bash

# - url: https://images.nga.gov/en/page/show_home_page.html
# - search image
# - Magnifying glass (Click to view detail ...)
# - View this object record on nga.gov
# - Zoom
# - Zoom to maximum

# usage: curlDl.sh 'NAME' TOPRIGHT 'URL'
# ./curlDl.sh "The Houses of Parliament, Sunset" 66 "https://media.nga.gov/fastcgi/iipsrv.fcgi?FIF=/public/objects/4/6/5/2/3/46523-primary-0-nativeres.ptif&SDS=0,90&JTL=8,3952"

# NAME     - destination directory
# TOPRIGHT - index of top-right block (number after last `,` in url)
# URL      - url of bottom-right block
if (( $# == 0 )); then
	echo 'Image filename(no extension):'
	read name
	echo 'Top-right block index:'
	read topright
	echo 'Bottom-right block URL:'
	read url
	if [[ -z "$name" || -z $topright || -z "$url" ]]; then
		echo -e "\nExit: Incomplete parameters\n"
		exit
	fi
else
	name="$1"
	topright=$2
	url=$3
fi
if [[ -e "$name" ]]; then
	echo -e "\nDirectory \e[36m$name\e[m exists:"
	echo -e '  \e[36m0\e[m Quit'
	echo -e '  \e[36m1\e[m Continue download\n'
	echo -e '\e[36m0\e[m / 1 ? '
	read -n 1 answer
	[[ $answer != 1 ]] && exit
else
	mkdir "$name"
fi
cd "$name"

tile=$(( topright + 1 ))x
count=${url##*,}
url=${url%,*}

# skip if already downloaded
downloaded=$( ls | tail -n1 | cut -d'.' -f1 )
ilast=$(( 10#$downloaded ))
if [[ -z $downloaded ]]; then
	istart=1
	left=$count
elif (( $ilast == $count )); then
	echo -e"\e[36m$\n$name\e[m already downloaded.\n"
	exit
else
	istart=$(( ilast + 1 ))
	left=$(( count - istart ))
	continue=*
fi

formatTime() {
	h=00$(( $1 / 3600 ))
	hh=${h: -2}
	m=00$(( $1 % 3600 / 60 ))
	mm=${m: -2}
	s=00$(( $1 % 60 ))
	ss=${s: -2}
	[[ $hh == 00 ]] && hh= || hh=$hh:
	echo $hh$mm:$ss
}

echo -e "\n\e[36m$name\e[m\n"
echo -e "Download image blocks ...\n"
echo -e "URL: $url\n"

curl -s -o 00000 $url,0
ext=$( file -b --mime-type 00000 | cut -d'/' -f2 )
[[ $ext == jpeg ]] && ext=jpg
mv 00000{,.$ext}

Sstart=$( date +%s )
for i in $( seq $istart $count ); do
	percent=$(( i * 100 / count ))
	elapse=$(( $( date +%s ) - Sstart ))
	t0=$(( elapse / (( 1 + i - istart )) * left ))
	tminus=$(( t0 - elapse ))
	elapse=$( formatTime $elapse )
	total=$( formatTime $t0 )
	tminus=$( formatTime $tminus )
	echo -e "T-\e[36m$tminus\e[m ${percent}% \e[36m$elapse/$total\e[m$continue $i/$count"
	
	iname=0000$i
	curl -s -o ${iname: -5}.$ext $url,$i
done

echo -e "\nMerge blocks into single image ...\n"

montage $( ls ) \
	-geometry +0+0 \
	-tile $tile \
	../"$name.$ext"

echo -e "\nImage file: $name.$ext\n"
