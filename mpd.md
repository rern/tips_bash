**MPD event monitor**
```sh
mpc idle

# monitor with broadcast "event" to "idle" pushstream channel
while true; do
curl -s -X POST "http://localhost/pub?id=idle" -d \"$( mpc idle )\"
done &
```

**BASH - MPD protocol command**
```sh
{ sleep 0.01; echo <command1>;[ echo <command2>;] sleep 0.01; } | telnet localhost 6600

# directory with spaces must be double quoted + echo must be single quoted
{ sleep 0.01; echo 'list title base "path name/directory name"'; sleep 0.1; } | telnet localhost 6600
```

`list [type] [filter] [argument]`

**MPD protocol command**
```sh
# connect
telnet localhost 6600

list title base USB/hdd/Music/A
```

**BASH mpc command**
```sh
mpc list title base USB/hdd/Music/A

count=$( mpc list title base USB/hdd/Music/A | grep -c '^Title:' )
```
```sh
# list  - get
# title - all songs (  )
# base  - in directory
# <arg> - directory relative to MPD 'music_directory'
#
# type   : artist, album, title, track, name, genre, date, composer, performer, comment, disc, filename, or any
# filter : TAG, file, base, modifid-since, AudioFormat
```

**BASH echo**
```sh
{ sleep 0.01; echo list title base USB/hdd/Music/A; sleep 0.01; } | telnet localhost 6600

count=$( { sleep 0.01; echo list title base USB/hdd/Music/A; sleep 0.01; } | telnet localhost 6600 | grep -c '^Title:' )
```
