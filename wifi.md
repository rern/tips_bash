### `netctl` - service
```sh
# profiles
netctl list

# start/stop
netctl [start/stop] <profile>

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

# get ip
ip addr show dev wlan0 | grep '^\s*inet' | awk '{print $2}'

# get gateway - ip - dns
gwip=$( ip r | grep 'default.*wlan0' | awk '{print $3" "$9}' )
dns=$( cat /etc/resolv.conf | grep nameserver | cut -d' ' -f2 )
gwipdns="$gwip $dns"

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

# get ssid
iw dev wlan0 link | grep SSID | awk '{print $NF}'

# scan
iwlist wlan0 scan

# connect
iw dev wlan0 connect [ssid] key [hex_key]

# disconnect
iw dev wlan0 disconnect
```
