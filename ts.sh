#!/bin/bash

# chrome <right-click> inspect > network
# play the movie
# network > find *.ts (type: xhr) <right-click> copy > Copy link address
# forward to end to get the last 'N'

# this file
# replace 'https://...' with copied address
# edit 'N' > {1..N}, directory, filename

# run ./ts.sh 

name='Flesh And Bone S01E08.ts'
dir=/mnt/hdd/Movies/Flesh_And_Bone_1

time0=$( date +%s )

[[ ! -e $dir ]] && mkdir $dir

rm -f "$dir/$name"
echo -e "\n$dir/$name\n"
wget -q --show-progress --tries=10 --retry-connrefused --timeout=2 --wait=1 \
https://s16.openstream.io/hls/qvsbe6etnpblgwsztq3kap62j7azw4e5mfbl5pcvv2gl472at67qop7z2qfa/seg-{1..200}-v1-a1.ts -O - >> "$dir/$name"

time1=$( date +%s )
timediff=$(( $time1 - $time0 ))
timemin=$(( $timediff / 60 ))
timesec=$(( $timediff % 60 ))
echo -e "\nDuration: $timemin min $timesec sec"

#last=5
#url="https://s8.openstream.io/hls/qvsbeqetnpblgwsztq3ka2o7lcdod2tnpvpbk4ks55ebys5g5bexnir7afxq/seg-{1..$last}-v1-a1.ts"
# 'eval' expands $last inside '{...}'
#eval wget -q --show-progress $url -O - >> "$dir/$name.ts"
