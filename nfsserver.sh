#!/bin/bash

optbox=( --colors --no-shadow --no-collapse )

share=$( dialog "${optbox[@]}" --output-fd 1 --nocancel --inputbox "
 Shared path to create:
" 0 0 )
rw=$( dialog "${optbox[@]}" --output-fd 1 --nocancel --menu "
 \Z1Permission\Z0:
" 8 0 0 \
1 read + write \
2 read only )
if [[ $rw == 1 ]]; then
	permission=666
	rw=rw
else
	permission=444
	rw=ro
fi

[[ ! -e /usr/bin/nfsconf ]] && pacman -Sy nfs-utils

mkdir -p $share
chmod -R $permission $share
! grep -q $share /etc/exports && echo "$share 192.168.1.0/24($rw,sync,no_subtree_check)" >> /etc/exports

systemctl restart nfs-server # debian: nfs-kernel-server
