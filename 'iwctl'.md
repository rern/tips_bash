### `iwctl`
- Auto reconnect by default (auto select ssid with optimun signal)
- `scan` not needed to reconnect saved ssid profiles
```sh
# start service
systemctl start iwd

# scan (run once)
iwctl station wlan0 scan

# available ssid list
iwctl station wlan0 get-networks

# #1 - connect (saved as /var/lib/iwd/$SSID.psk)
iwctl station wlan0 connect $SSID --passphrase $PASSPHRASE

# #2 - connect with *.psk ssid profile
echo "\
[Security]
Passphrase=PASSPHRASE
" > /var/lib/iwd/$SSID.psk

# show current status
iwctl station wlan0 show

# disconnect
iwctl station wlan0 disconnect

# reconnect
iwctl station wlan0 connect $SSID

# list saved ssid profiles
iwctl known-networks list

# remove saved profile
iwctl known-networks $SSID forget
```
