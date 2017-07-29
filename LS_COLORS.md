LS_COLORS
---

**set custom colors**  
`export LS_COLORS='fi=00;37:di=01;34'`  

**show default colors**  
`dircolors -p`  

**show current assigned colors**  
origin: https://github.com/gkotian/gautam_linux/blob/master/scripts/colours.sh  
```sh
IFS=:
for SET in $LS_COLORS; do
    TYPE=$(echo $SET | cut -d"=" -f1)
    COLOR=$(echo $SET | cut -d"=" -f2)

    case $TYPE in
        rs) TEXT="Reset to default colors";;
        
        no) TEXT="Global for non-assigned";;
        
        di) TEXT="Directory - Normal";;
        st) TEXT="Directory - Sticky (tmp)";;
        ow) TEXT="Directory - Other writable (. .. etc root run tmp)";;
        tw) TEXT="Directory - Sticky + Other writable (tmp)";;
        
        fi) TEXT="File - Normal";;
        ex) TEXT="File - Executable";;
        ca) TEXT="File - With capability";;
        mi) TEXT="File - Missing";;
        
        ln) TEXT="Link - Symbolic";;
        or) TEXT="Link - Orphaned";;
        mh) TEXT="Link - Multi-Hardlink";;
        
        pi) TEXT="Named pipe";;
        so) TEXT="Socket";;
        do) TEXT="Door";;
        
        bd) TEXT="Device - Block";;
        cd) TEXT="Device - Character";;
        
        su) TEXT="Set UID";;
        sg) TEXT="Set GID";;
        *)  TEXT="(unknown)"
    esac
    printf "%12s=%-7s \e[${COLOR}m$TEXT\e[0m\n" $TYPE $COLOR
done
```
