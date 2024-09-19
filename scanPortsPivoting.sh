#!/bin/bash

echo ""
ports=(21 22 23 25 53 80 110 143 443 445)
ips=(1 2 3 13 105)

for ip in "${ips[@]}"; do
 echo -e "IP: 10.0.0.$ip"
  for port in "${ports[@]}"; do
   timeout 1 bash -c "echo "" > /dev/tcp/10.0.0.$ip/$port" &>/dev/null && echo -e "\tPORT: $port - OPEN" &
  done
 echo -e "\n"
done; wait

echo ""
