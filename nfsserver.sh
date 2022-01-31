#!/bin/bash

optbox=( --colors --no-shadow --no-collapse )

share=$( dialog "${optbox[@]}" --output-fd 1 --nocancel --inputbox "
 Shared path to create:
" 0 0 )
rwx=$( dialog "${optbox[@]}" --output-fd 1 --nocancel --menu "
 \Z1Permission\Z0:
" 8 0 0 \
1 rwx \
2 rw- \
3 r-- )
if [[ $rwx == 1 ]]; then
	permission=777
elif [[ $rwx == 2 ]]; then
	permission=666
else
	permission=555
fi

[[ ! -e /usr/bin/nfsconf ]] && pacman -Sy nfs-utils # debian: nfs-kernel-server

mkdir -p $share
chmod -R $permission $share
echo "$share 192.168.1.0/24(rw,sync,no_subtree_check)" >> /etc/exports

systemctl restart nfs-server # debian: nfs-kernel-server
