#!/bin/bash

echo "===== System Information ====="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "Disk Usage:"
df -h | grep '/dev/'
echo "Memory Usage:"
free -h

