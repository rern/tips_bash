LS_COLORS
---

**set custom colors**  
`export LS_COLORS='fi=00;37:di=01;34'`  

**show default colors**  
`dircolors -p`  

**show customized colors**  
origin: https://github.com/gkotian/gautam_linux/blob/master/scripts/colours.sh  
```sh
IFS=:
for SET in $LS_COLORS; do
    TYPE=$(echo $SET | cut -d"=" -f1)
    COLOR=$(echo $SET | cut -d"=" -f2)

    case $TYPE in
        rs) TEXT="Reset to normal color (as assigned)";;
        no) TEXT="Global default (for non-assigned)";;
        
        di) TEXT="Directory";;
        st) TEXT="Sticky (tmp)";;
        ow) TEXT="Other writable (. .. etc root run tmp)";;
        tw) TEXT="Sticky other writable (tmp)";;
		
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
        sg) TEXT="Set GID";
    esac
    printf "%12s=%-7s \e[${COLOR}m${TEXT}\e[0m\n" "${TYPE}" "${COLOR}"
done
```
