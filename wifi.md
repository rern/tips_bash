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

# get ip
ip addr show dev wlan0 | grep '^\s*inet' | awk '{print $2}'

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
iw dev wlan0 link | grep SSID | awk '{print $2}'

# scan
iwlist wlan0 scan

# connect
iw dev wlan0 connect [ssid] key [hex_key]

# disconnect
iw dev wlan0 disconnect
```
