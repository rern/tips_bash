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
for set in $LS_COLORS; do
    type=$(echo $set | cut -d"=" -f1)
    color=$(echo $set | cut -d"=" -f2)

    case $type in
        rs) text="Reset to default colors";;
        
        no) text="Global for non-assigned";;
        
        di) text="Directory - Normal";;
        st) text="Directory - Sticky (tmp)";;
        ow) text="Directory - Other writable (. .. etc root run tmp)";;
        tw) text="Directory - Sticky + Other writable (tmp)";;
        
        fi) text="File - Normal";;
        ex) text="File - Executable";;
        ca) text="File - With capability";;
        mi) text="File - Missing from link (or -> mi)";;
        
        ln) text="Link - Symbolic";;
        or) text="Link - Orphaned";;
        mh) text="Link - Multi-Hardlink";;
        
        pi) text="Named pipe";;
        so) text="Socket";;
        do) text="Door";;
        
        bd) text="Device - Block";;
        cd) text="Device - Character";;
        
        su) text="Set UID";;
        sg) text="Set GID";;
        *)  text="(unknown)";;
    esac
    printf "%12s=%-7s \e[${color}m$text\e[0m\n" $type $color
done
```
