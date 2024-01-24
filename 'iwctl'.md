### `iwctl`

- Auto reconnect on boot by default (auto select ssid with optimun signal)
- `disconnect` profile - no auto reconnect (or `AutoConnect=false` in `/var/lib/iwd/$SSID.psk`)
- `scan` not needed to reconnect saved ssid profiles
- `iwctl` also starts `iwd.service`
- Manually configured `/var/lib/iwd/$SSID.psk`
	- `PreSharedKey` must be included with `Passphrase`
	- `presharedkey=$( wpa_passphrase "$ssid" "$passphrase" | grep '\spsk=' | cut -d= -f2 )`

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

# #2 - connect with *.psk ssid profile
echo "\
[Security]
Passphrase=$PASSPHRASE
" > /var/lib/iwd/$SSID.psk

# disable autoconnect (default: true)
# hidden ssid         (default: false)
echo "\
[Settings]
AutoConnect=false
Hidden=true
" >> /var/lib/iwd/$SSID.psk

# show current connection status
iwctl station $DEVICE show

# show device info
iwctl device $DEVICE show

# disconnect
iwctl station $DEVICE disconnect

# reconnect
iwctl station $DEVICE connect $SSID

# list saved ssid profiles
iwctl known-networks list

# remove saved profile
iwctl known-networks $SSID forget
```
