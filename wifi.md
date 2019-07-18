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
list=$( iw dev wlan0 scan | grep '^\s*signal\|^\s*SSID' | sed 's/^\s*signal: \|^\s*SSID: //' )
readarray -t lines <<<"$list"
iL=${#lines[@]}
for (( i=0; i < iL; i++ )); do
    name=${lines[i+1]}
    [[ -n $name ]] && ssid="$ssid\n${lines[i]}^$name"
    (( i++ ))
done
ssids=$( echo -e "$ssid" | sort )
readarray -t ssids <<<"$ssids"
for ssid in "${ssids[@]}"; do
	echo $ssid | cut -d'^' -f2
done

# connect
iw dev wlan0 connect your_essid key hex_key
```
