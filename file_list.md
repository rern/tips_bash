### File list
```sh
# files and directories
itemarray=( "/path/to/dir/"* )
item0=${itemarray[0]}

# files
filearray=( "/path/to/dir/"*.* )
file0=${filearray[0]}

# directories
dirarray=( "/path/to/dir/"*/ )
dir0=${dirarray[0]}

# parts from path
path=/path/to/dir/file.ext
dir=$( dirname "$path" )
file=$( basename "$path" )
filename=${file%.*} # or $( basename "$path" .${path##*.} )
fileext=${file##*.} # or ${path##*.}
```
- quote 
	- path with spaces
	- wildcards outside quotes
