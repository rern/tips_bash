LS_COLORS
---

**set custom LS_COLORS**  
```sh
export LS_COLORS='fi=00;38;5;202:di=01;34'
# export LS_COLORS='xx=nn;nn;n;nnn:*.xxx=nn;nn'
# 'xx=' element code,  '*.xxx' file extension,  'nn' color/style code,  ';' combine codes,  ':' elements separator
```

[**256 colors for terminal**](https://github.com/rern/bash_tips/blob/master/color.md)

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
        ow) text="Directory - Writable by others (drwxrw-rw-)";;
        st) text="Directory - No delete/rename by others (drwxrw-rwt) 'sticky'";;
        tw) text="Directory - Writable + no delete/rename by others (drwxrwxrwt)";;
        su) text="Directory - set-user-ID";;
        sg) text="Directory - set-group-ID";;
        
        fi) text="File - Normal";;
        ex) text="File - Executable";;
        mi) text="File - Missing from orphaned link (or -> mi)";;
        ca) text="File - With capability (-rwxrwxrwx+) 'xattr'";;
        pi) text="File - Named pipe (prwx------) 'fifo'";;
        so) text="File - Socket (srwx------)";;
        do) text="File - Door (Drwx------)";;
                
        ln) text="Link - Symbolic";;
        or) text="Link - Orphaned";;
        mh) text="Link - Multi-Hardlink";;
        
        bd) text="Device - Block";;
        cd) text="Device - Character";;
        
        *)  text="File extension - $element";;
    esac
    printf "%12s=%-7s \e[${color}m$text\e[0m\n" $element $color
done
```
