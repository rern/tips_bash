### `iwctl`

- Auto reconnect on boot by default (auto select ssid with optimun signal)
- `$SSID` must be in `get-networks` to reconnect saved profiles
- `iwctl` also starts `iwd.service`
- Filter `stdout` color encoded lines: `sed $'s/\e\\[[0-9;:]*[a-zA-Z]//g'`

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
echo "\
# required - both
# PRESHAREDKEY=$( wpa_passphrase "$ssid" "$passphrase" | grep '\spsk=' | cut -d= -f2 )
[Security]
PreSharedKey=$PRESHAREDKEY
Passphrase=$PASSPHRASE

# static ip - optional
[IPv4]
Address=$ADDRESS
Gateway=$GATEWAY

# hidden ssid - optional
[Settings]
Hidden=true
" >> /var/lib/iwd/$SSID.psk

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
