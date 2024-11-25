#!/bin/bash

echo "System Hostname:"
hostname
echo ""

echo "Operating System:"
lsb_release -d | awk -F"\t" '{print $2}'
echo ""

echo "System Uptime:"
uptime -p
echo ""

echo "Linux Kernel Version:"
uname -r
echo ""

echo "CPU Information:"
grep -m 1 "model name" /proc/cpuinfo | awk -F: '{print $2}' | sed 's/^ //'
echo ""

echo "Memory Information (Available/Free):"
free -h | awk 'NR==2{printf "Total: %s | Used: %s | Free: %s\n", $2, $3, $4}'
echo ""

echo "Network Interfaces Information:"
ip -brief addr show | awk '{print $1, $3, $4}'
echo ""

echo "Filesystem Utilization:"
df -hT | awk 'NR==1 || /\/$/'
echo ""

echo "Last 5 Log Errors (Case-insensitive):"
sudo grep -i "error" /var/log/syslog | tail -n 5
echo ""
