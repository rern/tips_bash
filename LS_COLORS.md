LS_COLORS
---

**set custom LS_COLORS**  
```sh
export LS_COLORS='fi=00;38;5;202:di=01;34'
# 'xx=' element,  ';' combine,  ':' separator
```

[**256 colors**](https://github.com/rern/bash_tips/blob/master/color.md)

**show default LS_COLORS**  
```sh
dircolors -p
```

**show current assigned LS_COLORS**  
origin: https://github.com/gkotian/gautam_linux/blob/master/scripts/colours.sh  
```sh
IFS=:
for each in $LS_COLORS; do
    element=$(echo $each | cut -d"=" -f1)
    color=$(echo $each | cut -d"=" -f2)

    case $element in
        rs) text="Reset to default colors";;
        
        no) text="Global for non-assigned";;
        
        di) text="Directory - Normal";;
        ow) text="Directory - Writable by others (drwxrwxrwx)";;
        st) text="Directory - No delete/rename by others (drwxr-xr-t) 'sticky'";;
        tw) text="Directory - Writable + no delete/rename by others (drwxrwxrwt)";;
        su) text="Directory - set-user-ID";;
        sg) text="Directory - set-group-ID";;
        
        fi) text="File - Normal";;
        ex) text="File - Executable";;
        ca) text="File - With capability";;
        mi) text="File - Missing from orphaned link (or -> mi)";;
        
        ln) text="Link - Symbolic";;
        or) text="Link - Orphaned";;
        mh) text="Link - Multi-Hardlink";;
        
        pi) text="Named pipe";;
        so) text="Socket";;
        do) text="Door";;
        
        bd) text="Device - Block";;
        cd) text="Device - Character";;
        
        *)  text="$element";;
    esac
    printf "%12s=%-7s \e[${color}m$text\e[0m\n" $element $color
done
```
