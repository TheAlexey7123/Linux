#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

tput civis                    
url="$1"

function ctrl_c(){
    tput cnorm
    echo -e "\n\n\t${redColour}[+] ${grayColour}Cancelling${turquoiseColour}...${endColour}\n"
    exit 1
}

trap ctrl_c INT

if [ $# -ne 2 ]; then
    echo -e "\n\t${redColour}[+] ${grayColour}Use: ${turquoiseColour}./mp4download.sh ${purpleColour}\"url\" ${greenColour}\"directory\"\n${endColour}"
    exit 1
fi

curl "$url" &>/dev/null > html
html="$(pwd)/html"
cat $html | grep "a href=.*\.mp4" | cut -d "<" -f 3 | cut -d "\"" -f 2 > links
videos="$(pwd)/links"
mkdir "$2"
sleep 1
cd "$(pwd)/$2"
i=0

for linea in $(/bin/cat $videos 2>/dev/null); do
    let i=i+1
    nombre="$(echo $linea | sed "s/%c2%a1/¡/g" | sed "s/%20/ /g" | sed "s/%c3%b3/o/g" | sed "s/%c2%a1/¿/g" | sed "s/%c2%bf/¿/g" | sed "s/%c3%b1/ñ/g | sed "s/%c3%a1/a/g")"
    echo -e "\n\t${redColour}[+] ${grayColour}Downloading .mp4 nº${redColour}$i${grayColour}: ${turquoiseColour}$nombre${redColour}\n"
    curl $url/$linea > "$nombre"
    echo -e "\n\t${redColour}[+] ${endColour}${grayColour}Downloaded .mp4 nº${redColour}$i${grayColour}: ${turquoiseColour}$nombre${endColour}\n"
done

tput cnorm

echo -e "\n\t${redColour}[+] ${grayColour}Downloaded all ${turquoiseColour}$i .mp4${endColour}\n"
