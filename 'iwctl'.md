### `iwctl`
- Auto reconnect by default (auto select ssid with optimun signal)
- `scan` not needed to reconnect saved ssid profiles
- Once run `iwctl`, `iwd.service` started automatically.
```sh
# start service
systemctl start iwd

# list wlan devices
iwctl device list

# scan (run once)
iwctl station $DEVICE scan

# available ssid list
iwctl station $DEVICE get-networks

# #1 - connect (saved as /var/lib/iwd/$SSID.psk)
iwctl station $DEVICE connect $SSID --passphrase $PASSPHRASE

# #2 - connect with *.psk ssid profile
echo "\
[Security]
Passphrase=$PASSPHRASE
" > /var/lib/iwd/$SSID.psk

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
