### `netctl` - service
```sh
# profiles
netctl list

# start
netctl start <profile>
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
```

### `iw` - connect
```sh
# status
iw dev wlan0 link

# scan
iw dev wlan0 scan

# connect
iw dev wlan0 connect your_essid key hex_key
```
