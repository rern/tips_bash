
`list [type] [filter] [argument]`

**MPD protocol command**
```sh
# connect
telnet localhost 6600

list title base USB/hdd/Music/A
```

**mpc command**
```sh
list title base USB/hdd/Music/A
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
