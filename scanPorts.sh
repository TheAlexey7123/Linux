#!/bin/bash
#done by Alexey

tput civis

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
 tput cnorm; echo -e "\n"; exit 1
}

if [ ! "$#" -eq 1 ]; then
 echo -e "\n${grayColour}[+]${redColour} Use${grayColour}: ${redColour}./scanPorts \"IP-Adress\"${endColour}\n"
 tput cnorm
 exit 1
fi

trap ctrl_c INT

echo -e "\n${grayColour}[+]${redColour} Scanning ports of ${grayColour}$1:${endColour}\n"

for port in $(seq 1 65535); do
 timeout 1 /bin/bash -c "echo '' > /dev/tcp/$1/$port" &>/dev/null && echo -e "\t${grayColour}[+] ${redColour}Port ${grayColour}$port ${redColour}opened${endColour}" &
done; wait

echo -e "\n"

tput cnorm
