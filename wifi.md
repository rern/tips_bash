### `netctl` - service
```sh
# profiles
netctl list

# start
netctl start <profile>

# auto start
systemctl enable netctl-auto@wlan0
```

### WiFi connection menu
`wifi-menu`

### `ip` - interface
```sh
# status
ip link

# ip
ip addr show

# set ip
ifconfig wlan0 [ip]

# up/down
ip link set dev wlan0 [up/down]
# or
ifconfig wlan0 [up/down]
```

### `iw` - connect
```sh
# status
iw dev wlan0 link

# scan > sorted ssid list
scan=$( iwlist wlan0 scan | grep '^\s*Qu\|^\s*En\|^\s*ES' | sed 's/^\s*Quality=\|\/.* \+Signal level=.*\|^\s*Encryption key:\|^\s*ESSID://g' )
readarray -t lines <<<"$scan"
iL=${#lines[@]}
for (( i=0; i < iL; i+=3 )); do
    quality=$ssids${lines[i]}
    encryption=${lines[i+1]}
    ssid=${lines[i+2]}
    ssid=${ssid:1:-1}
    [[ -n $ssid ]] && ssids="$ssids$quality$encryption$ddis"
done
ssids=${ssids::-2} # remove last \n
ssids=$( echo -e "$ssids" | sort -r )


# connect
iw dev wlan0 connect your_essid key hex_key

# disconnect
iw dev wlan0 disconnect
```
