### `iwctl`
- Auto reconnect by default
- Require `scan` before connect unknown(never connected) ssid
```sh
# start service
systemctl start iwd

# scan (run once)
iwctl station wlan0 scan

# ssid list
iwctl station wlan0 get-networks

# #1 - connect (saved as /var/lib/iwd/$SSID.psk)
iwctl station wlan0 connect $SSID --passphrase $PASSPHRASE

# #2 - connect with *.psk ssid profile
echo "\
[Security]
Passphrase=PASSPHRASE
" > /var/lib/iwd/$SSID.psk

# disconnect
iwctl station wlan0 disconnect

# reconnect
iwctl station wlan0 connect $SSID

# remove ssid profile
iwctl known-networks $SSID forget
```
