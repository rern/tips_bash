Terminal colors
---

`\e[Nm` : syntax  

`\e`, `\033`, `\x1B` : \<escape\> character   
`N` :  code  

`0` : reset all  
`1` : bold / bright  
`2` : dim  
`4` : underline  
`5` : blink  
`7` : reverse  
`8` : hidden  
`21..28` : reset 1..8  

`31..37` : foreground  
`41..47` : background  

`38;5;N` : foreground  
`48;5;N` : background  

**8 colors**
```sh
# 'setaf 7', 'setab 0' - reset to default
# foreground 'setaf N'
echo "$(tput setaf N)STRING$(tput setaf 7)"
# background 'setab N'
echo "$(tput setab N)STRING$(tput setab 0)"
# foreground + background 'setaf N' 'setab N'
echo "$(tput setaf N; tput setab N)STRING$(tput setaf 7; tput setab 0)"

# foreground '\e[30..37m'
echo -e "\e[3NmSTRING\e[0m"
# background '\e[40..47m' - basic 8 colors
echo -e "\e[4NmSTRING\e[0m"
# foreground + background '\e[3N;4Nm'
echo -e "\e[3N;4NmSTRING\e[0m"
``` 

**256 colors**
```sh
# foreground '\e[38;5;Nm'
echo -e "\e[38;5;NmSTRING\e[0m"

# background '\e[48;5;Nm'
echo -e "\e[48;5;NmSTRING\e[0m"

# foreground + background '\e[38;5;Nm\e[48;5;Nm'
echo -e "\e[38;5;Nm\e[48;5;NmSTRING\e[0m"
```
![color](https://github.com/rern/tips/blob/master/bash/color_chart.png)  
image from:[Wikipedis](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors)

**Print color chart**
```sh
for i in {0..255}; do
	code=$( printf %03d $i )
	printf "\e[48;05;${i}m  \e[0m \e[38;05;${i}m$code\e[0m  "
	(( i == 7 )) || (( i == 243 )) || (( i == 255 )) && echo
	( (( i == 15 )) || (( i > 15 )) && (( i < 232 )) && (( (i-15) % 6 == 0 )) ) && echo
done
```
