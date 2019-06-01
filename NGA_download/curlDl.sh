#!/bin/bash

# Download hi-resolution images from National Gallery Of Art
# - url: https://images.nga.gov/en/page/show_home_page.html
# - search image
# - Magnifying glass (Click to view detail ...)
# - View this object record on nga.gov
# - Zoom
# - Zoom to maximum

# usage: curlDl.sh 'NAME' TOPRIGHT 'URL'
# curlDl.sh "The Houses of Parliament, Sunset" 66 "https://media.nga.gov/fastcgi/iipsrv.fcgi?FIF=/public/objects/4/6/5/2/3/46523-primary-0-nativeres.ptif&SDS=0,90&JTL=8,3952"

# NAME     - destination directory
# TOPRIGHT - index of top-right block (number after last `,` in url)
# URL      - url of bottom-right block

name="$1"
if [[ -e "$name" ]]; then
	echo -e "\nDirectory $name exists.\n"
	exit
fi

tile=$(( $2 + 1 ))x
url=$3
count=${url##*,}
url=${url%,*}

mkdir "$name"
cd "$name"

echo -e "\nDownload image blocks ...\n"
echo -e "URL: $url\n"

for i in $( seq 0 $count ); do
	echo $i/$count' - '$(( $i * 100 / $count ))'%'
	iname=000$i
	curl -# -o ${iname: -4} $url,$i
done

echo -e "\nMerge blocks into single image ...\n"

ext=$( file -b --mime-type 0000 | cut -d'/' -f2 )
[[ $ext == jpeg ]] && ext=jpg
for file in *; do mv $file $file.$ext; done
montage $( ls ) \
	-geometry +0+0 \
	-tile $tile \
	../"$name.$ext"

echo -e "\nImage file: $name.$ext\n"
