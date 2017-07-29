LS_COLORS
---

**set custom colors**  
`export LS_COLORS='fi=00;37:di=01;34'`  

**show default colors**  
`dircolors -p`  

**show current customized colors**  
```sh
eval $( echo "no:global default;
fi:normal file;
di:directory;
ln:symbolic link;
pi:named pipe;
so:socket;
do:door;
bd:block device;
cd:character device;
or:orphan symlink;
mi:missing file;
su:set uid;
sg:set gid;
tw:sticky other writable;
ow:other writable;
st:sticky;
ex:executable;
" | sed -e 's/:/="/g; s/\;/"\n/g' )     
{
    IFS=:
    for i in $LS_COLORS; do
        echo -e "\e[${i#*=}m$( x=${i%=*}; [ "${!x}" ] && echo "${!x}" || echo "$x" )\e[m"
    done
}
```
