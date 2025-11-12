#!/bin/bash

echo "===== System Information ====="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime:"
uptime | awk -F'(up|, user)' '{print $2}' | sed 's/^ //'
echo "Disk Usage:"
df -h | grep '/dev/'
echo "Memory Usage:"
vm_stat | awk '
/Pages free/ {free=$3}
/Pages active/ {active=$3}
/Pages inactive/ {inactive=$3}
/Pages speculative/ {spec=$3}
/Pages wired down/ {wired=$4}
END {
  page_size=4096
  total=(free+active+inactive+spec+wired)*page_size/1024/1024
  free_mb=free*page_size/1024/1024
  used_mb=(active+inactive+spec+wired)*page_size/1024/1024
  printf "Total: %.0f MB\nUsed: %.0f MB\nFree: %.0f MB\n", total, used_mb, free_mb
}'

