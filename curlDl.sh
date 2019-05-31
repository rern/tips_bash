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
echo URL: $url
for i in $( seq 0 $count ); do
	echo $i/$count '('$(( $i * 100 / $count ))'%)' $i.jpg
	curl -# -o "$name/$i.jpg" $url$i
done

cd "$name"
files=$( ls -v )
columns=$(( $topright + 1 ))
montage $files -geometry +0+0 -tile $columns'x' -limit memory 1mb ../"$name.jpg"

echo -e "\nFile: $name.jpg\n"
