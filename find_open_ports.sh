#!/usr/bin/env bash

ports=$(nmap -p- --min-rate=1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)

echo
echo "Found open ports: $ports"
echo "Getting more information about open ports..."
echo

nmap -sC -sV -p$ports $1
