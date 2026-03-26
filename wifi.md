### `wpa_supplicant`
- No internet, no `nmcli` *(Debian standard / text mode)*
```sh
export PATH=$PATH:/sbin

# credential
conf=wpa.conf
echo p2p_disabled=1 > $conf
wpa_passphrase SSID PASSWORD >> $conf

#connect
ip link show # get interface
wpa_supplicant -B -i <wlo1> -c $conf
dhcpcd <wlo1> # obtain ip address
```

### `nmcli`
- Easiest to use
```sh
nmcli device wifi rescan
nmcli device wifi list
nmcli device wifi connect SSID password PASSWORD
```

### `netctl`
- Light weight, default on Arch Linux Arm
```sh
# interactive connection
wifi-menu

# profiles
netctl list

# start
ifconfig <wlan0> down # must not "UP" before start
netctl start <profile>

# stop
netctl stop <profile>

# auto start
systemctl enable netctl-auto@wlan0

# ip - gateway
netctl status <profile> | grep 'leased\|route via' | sed 's/.* \([0-9]*.[0-9]*.[0-9]*.[0-9]\).*/\1/'
```

### `iw`
- Faster than `netctl` but there're still issues on Arch Linux Arm
```sh
# status
iw dev <wlan0> link

# get ssid
iw dev <wlan0> link | grep SSID | awk '{print $NF}'

# scan
iwlist <wlan0> scan

# connect
iw dev <wlan0> connect [ssid] key [hex_key]

# disconnect
iw dev <wlan0> disconnect
```

### `ip` 
- Manage interface
```sh
# status
ip link

# ip
ip addr show

# get ip
ip addr show dev <wlan0> | grep '^\s*inet' | awk '{print $2}'

# get gateway - ip - dns
gwip=$( ip r | grep 'default.*<wlan0>' | awk '{print $3" "$9}' )
dns=$( cat /etc/resolv.conf | grep nameserver | cut -d' ' -f2 )
gwipdns="$gwip $dns"

# set ip
ifconfig <wlan0> [ip]

# remove ip
ifconfig <wlan0> 0.0.0.0

# up/down
ip link set dev <wlan0> [up/down]
# or
ifconfig <wlan0> [up/down]
```
