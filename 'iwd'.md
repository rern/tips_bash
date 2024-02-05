### `iwd`

`/etc/iwd/main.conf`
```sh
[General]
EnableNetworkConfiguration=true

[Scan]
DisablePeriodicScan=true

[Network]
EnableIPv6=false
```

### `iwctl`

- Auto reconnect on boot by default (auto select ssid with optimun signal)
- `$SSID` must be in `get-networks` to reconnect saved profiles
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

# #1 - connect (to be saved as /var/lib/iwd/$SSID.psk)
iwctl station $DEVICE [connect|connect-hidden] $SSID --passphrase $PASSPHRASE

# #2 - connect with pre-configured profile
if [[ $SSID =~ [^a-zA-Z0-9\ _-] ]]; then # if $SSID contains special charaters
	HEX_ENCODE=$( echo -n "$SSID" | od -A n -t x1 | tr -d ' ' )
	PROFILE=/var/lib/iwd/=$HEX_ENCODE.psk
else
	PROFILE=/var/lib/iwd/$SSID.psk # .open if no passphrase
fi
# required - both or omit both if no passphrase
PRESHAREDKEY=$( wpa_passphrase "$ssid" "$passphrase" | grep '\spsk=' | cut -d= -f2 )
data="\
[Security]
PreSharedKey=$PRESHAREDKEY
Passphrase=$PASSPHRASE
"
# static ip - optional
data+=
[IPv4]
Address=$ADDRESS
Gateway=$GATEWAY
"
# hidden ssid - optional
data+="
[Settings]
Hidden=true
"
echo "$data" >> "$PROFILE"

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
# filename - hex encode ssid with special characters: wifi@r > =776966694072
[[ $1 =~ [^a-zA-Z0-9\ _-] ]] && hex==$( echo -n "$1" | od -A n -t x1 | tr -d ' ' )

# decode hex filename: =776966694072 > wifi@r
ssid=${ssid:1}
while (( ${#ssid} > 0 )); do
	hex+="\x${ssid:0:2}"
	ssid=${ssid:2}
done
ssid=$( echo -e $hex )

# remove color encoded lines
sed $'s/\e\\[[0-9;:]*[a-zA-Z]//g' <<< $stdout
```
