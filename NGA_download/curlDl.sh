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
	if (( $i < 10 )); then
		filename="000$i.jpg"
	else if (( $i < 100 )); then
		filename="00$i.jpg"
	else if (( $i < 1000 )); then
		filename="0$i.jpg"
	fi
	echo $i/$count '('$(( $i * 100 / $count ))'%)' $filename.jpg
	curl -# -o "$name/$i.jpg" $url$i
done

echo -e "\nImages downloaded successfully.\n"
echo -e "\nMerge all into a single image:"
echo -e '  \e[36m0\e[m No'
echo -e '  \e[36m1\e[m Yes'
echo
echo -e '\e[36m0\e[m / 1 ? '
read -n 1 answer
echo
if [[ $answer != 1 ]]; then
	echo -e "\nDownload directory: $name\n"
	echo "Imagemagic 7: magick montage *.* -geometry +0+0 -tile $(( $topright + 1 ))x ../$name.jpg"
	exit
fi

cd "$name"

montage $( ls ) \
	-geometry +0+0 \
	-tile $(( $topright + 1 ))'x' \
	-limit memory 32 \
	-limit map 32 \
	../"$name.jpg"

echo -e "\nFile: $name.jpg\n"
