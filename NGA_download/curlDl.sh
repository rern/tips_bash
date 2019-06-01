#!/bin/bash

# Download hi-resolution images from National Gallery Of Art
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

name="$1"
mkdir -p "$name"
cd "$name"

tile=$(( $2 + 1 ))x
url=$3
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
	istart=$(( $ilast + 1 ))
	left=$(( $count - $istart ))
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
	percent=$(( $i * 100 / $count ))
	elapse=$(( $( date +%s ) - $Sstart ))
	total=$( formatTime $(( $elapse / $(( 1 + $i - $istart )) * $left )) )
	elapse=$( formatTime $elapse )
	echo -e "${percent}% \e[36m$elapse/$total\e[m $i/$count"
	iname=0000$i
	curl -s -o ${iname: -5}.$ext $url,$i
done

echo -e "\nMerge blocks into single image ...\n"

montage $( ls ) \
	-geometry +0+0 \
	-tile $tile \
	../"$name.$ext"

echo -e "\nImage file: $name.$ext\n"
