LS_COLORS
---

**set custom colors**  
`export LS_COLORS='fi=00;37:di=01;34'`  

**show default colors**  
`dircolors -p`  

**show current customized colors**  
origin: https://github.com/gkotian/gautam_linux/blob/master/scripts/colours.sh  
```sh
IFS=:
for SET in $LS_COLORS; do
    TYPE=$(echo $SET | cut -d"=" -f1)
    COLOR=$(echo $SET | cut -d"=" -f2)

    case $TYPE in
        rs) TEXT="Reset to normal color";;
        no) TEXT="Global default";;
        
        di) TEXT="Directory";;
        tw) TEXT="Sticky other writable";;
        ow) TEXT="Other writable";;
        st) TEXT="Sticky";;
        fi) TEXT="Normal file";;
        ex) TEXT="Executable";;
        ca) TEXT="File with capability";;
        mi) TEXT="Missing file";;
        
        ln) TEXT="Symbolic link";;
        or) TEXT="Orphaned symbolic link";;
        mh) TEXT="Multi-Hardlink";;
        
        pi) TEXT="Named pipe";;
        so) TEXT="Socket";;
        do) TEXT="Door";;
        bd) TEXT="Block device";;
        cd) TEXT="Character device";;
        su) TEXT="Set UID";;
        sg) TEXT="Set GID";;
        *) TEXT="${TYPE} (TODO: get description)";;
    esac
    printf "%12s=%-7s \e[${COLOR}m${TEXT}\e[0m\n" "${TYPE}" "${COLOR}"
done
```
