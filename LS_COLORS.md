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
        no) TEXT="Global default";;
        fi) TEXT="Normal file";;
        di) TEXT="Directory";;
        ln) TEXT="Symbolic link";;
        pi) TEXT="Named pipe";;
        so) TEXT="Socket";;
        do) TEXT="Door";;
        bd) TEXT="Block device";;
        cd) TEXT="Character device";;
        or) TEXT="Orphaned symbolic link";;
        mi) TEXT="Missing file";;
        su) TEXT="Set UID";;
        sg) TEXT="Set GID";;
        tw) TEXT="Sticky other writable";;
        ow) TEXT="Other writable";;
        st) TEXT="Sticky";;
        ex) TEXT="Executable";;
        rs) TEXT="Reset to \"normal\" color";;
        mh) TEXT="Multi-Hardlink";;
        ca) TEXT="File with capability";;
        *) TEXT="${TYPE} (TODO: get description)";;
    esac
    printf "%12s=%-7s \e[${COLOR}m${TEXT}\e[0m\n" "${TYPE}" "${COLOR}"
done
```
