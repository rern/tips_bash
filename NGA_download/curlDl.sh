#!/bin/bash

# Download hi-resolution images from National Gallery Of Art
# - url: https://images.nga.gov/en/page/show_home_page.html
# - search image
# - Magnifying glass (Click to view detail ...)
# - View this object record on nga.gov
# - Zoom
# - Zoom to maximum
# - Get url of the last block at bottom right > URL,COUNT
# - Get top-right block index > TOPRIGHT

# usage: curlDl.sh NAME COUNT TOPRIGHT 'URL'

# NAME  - destination nameectory
# COUNT - number of last index (last number of each url)
# URL   - url without index

name="$1"
count=$2
topright=$3
url=$4
if [[ -e "$name" ]]; then
	echo -e "\nnameectory $name exists.\n"
	exit
fi

mkname "$name"
cd "$name"
echo -e "\nDownload images ...\n"
echo -e "URL: $url\n"

for i in $( seq 0 $count ); do
	name=000$i
	filename=${name: -4}.jpg
	echo $i/$count '('$(( $i * 100 / $count ))'%)' $filename
	curl -# -o $filename.jpg $url$i
done

echo -e "\nMerge into a single image ...\n"

montage $( ls ) \
	-geometry +0+0 \
	-tile $(( $topright + 1 ))'x' \
	-limit memory 32 \
	-limit map 32 \
	../"$name.jpg"

echo -e "\nFile: $name.jpg\n"
