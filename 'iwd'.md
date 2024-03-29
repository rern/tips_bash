### `iwd`

`/etc/iwd/main.conf`
```sh
### required: enable dhcp client
[General]
EnableNetworkConfiguration=true


### optional:
[Network]
EnableIPv6=false
RoutePriorityOffset=300  # offset priority from wired lan when connect simultaneously

[Scan]
DisablePeriodicScan=true # periodically scans for available networks in disconnected state
                         # If disabled, always scan before connect (otherwise not reliable)
```

### `iwctl`

- Auto reconnect on boot by default (auto select ssid with optimun signal)
- `$SSID` must be populated by scan in `get-networks` to connect/reconnect
- `iwctl` also starts `iwd.service`
	
```sh
# start service
systemctl start iwd

# list wlan devices
iwctl device list

# scan (run once)
iwctl station $DEVICE scan [$HIDDEN_SSID]

# available ssid list
iwctl station $DEVICE get-networks

# (optional) pre-configure before connect with static ip
if [[ $SSID =~ [^a-zA-Z0-9\ _-] ]]; then # if $SSID contains special charaters
	HEX_ENCODE=$( echo -n "$SSID" | od -A n -t x1 | tr -d ' ' )
	PROFILE=/var/lib/iwd/=$HEX_ENCODE.psk
else
	PROFILE=/var/lib/iwd/$SSID.psk # .open if no passphrase
fi
echo "\
[IPv4]
Address=$ADDRESS
Gateway=$GATEWAY
" > "$PROFILE"

# disable auto reconnect
echo "\
[Settings]
AutoConnect=false
" >> "$PROFILE"

### connect
# #1 - to be saved as /var/lib/iwd/$SSID.psk
iwctl station $DEVICE connect $SSID --passphrase $PASSPHRASE

# #2 - to be saved as /var/lib/iwd/$SSID.open
iwctl station $DEVICE connect $SSID

# #3 - hidden ssid - explicit scan
iwctl station $DEVICE scan $SSID
iwctl station $DEVICE connect-hidden $SSID --passphrase $PASSPHRASE

# show current connection status
iwctl station $DEVICE show

# show device info
iwctl device $DEVICE show

# disconnect - no auto reconnect on boot
iwctl station $DEVICE disconnect

# reconnect
iwctl station $DEVICE connect $SSID

# list saved ssid profiles
iwctl known-networks list

# remove saved profile
iwctl known-networks $SSID forget
```

- Process data
```sh
# decode hex filename: =776966694072 > wifi@r
name=${filename:1}
while (( ${#name} > 0 )); do
	hex+="\x${name:0:2}"
	name=${name:2}
done
ssid=$( echo -e $hex )

# remove encoded color from stdout
iwctl station wlan0 get-networks | sed $'s/\e\\[[0-9;]*m\**//g'

# ssid names only list
iwctl station wlan0 get-networks \
	| sed -e '1,4 d' -e $'s/\e\\[[0-9;]*m>*//g' \
	| awk 'NF{NF-=2}1 && NF'
```
