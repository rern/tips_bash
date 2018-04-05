DSD Info bytes
---
Get bitrate from DSD files

```sh
#!/bin/bash

#|----------------------------------------------------------|
#|        |          |          |     DSF     |     DFF     |
#|        |    dec   |    hex   |  5758 5960  |  6162 6364  |
#|----------------------------------------------------------|
#| dsd64  |  2822400 | 002b1100 |  1100 002b  |  2b00 0011  |
#| dsd128 |  5644800 | 00562200 |  2200 0056  |  5600 0022  |
#| dsd256 | 11289600 | 00AC4400 |  4400 00AC  |  AC00 0044  |
#| dsd512 | 22579200 | 01588800 |  8800 0158  |  5801 0088  |
#|----------------------------------------------------------|

file=/path/file.ext
ext=$( echo $file | sed 's/^.*\.//' | tr '[:lower:]' '[:upper:]' )

IFS0=$IFS
IFS=$( echo -en "\n\b" )
if [[ $ext == DSF ]]; then
	hexword=$( hexdump -x -s56 -n4 $file )
	# string=0000040 <5758> <5960> 000003c
	IFS=$IFS0
	hex=( $( echo $hexword | cut -d' ' -f2,3 ) )
	# bitrate byte order: #59#60#57#58
	bitrate=$( echo $(( 16#${hex[1]}${hex[0]} )) )
else # DFF
	hexword=$( hexdump -x -s60 -n4 $file )
	# string=000003c <6162> <6364> 0000040
	IFS=$IFS0
	hex=( $( echo $hexword | cut -d' ' -f2,3 | tr -d ' ' | sed 's/.\{2\}/& /g' ) )
	# bitrate byte order: #62#61#64#63
	bitrate=$( echo $(( 16#${hex[1]}${hex[0]}${hex[3]}${hex[2]} )) )
fi

echo $bitrate
```
