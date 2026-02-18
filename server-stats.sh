#!/bin/bash

echo "========================================================="
echo "Server Performance Stats - $(date)"
echo "========================================================="

# 1. Total CPU Usage
echo "--- Total CPU Usage ---"
cpu_idle=$(vmstat 1 2 | tail -1 | awk '{print $15}')
cpu_usage=$(awk "BEGIN {print 100 - $cpu_idle}")
echo "Total CPU Usage: $cpu_usage%"

# 2. Total Memory Usage
echo -e "\n--- Total Memory Usage ---"
free -m | awk 'NR==2{printf "Total: %sMB | Used: %sMB | Free: %sMB | %.2f%% Used\n", $2, $3, $4, $3*100/$2 }'

# 3. Total Disk Usage
echo -e "\n--- Total Disk Usage ---"
df -h --total 2>/dev/null | grep 'total' | awk '{printf "Total: %s | Used: %s | Free: %s | %s Used\n", $2, $3, $4, $5}'
if [ ${PIPESTATUS[0]} -ne 0 ]; then
    df -h / | awk 'NR==2{printf "Total: %s | Used: %s | Free: %s | %s Used\n", $2, $3, $4, $5}'
fi

# 4. Top 5 Processes by CPU Usage
echo -e "\n--- Top 5 Processes by CPU Usage ---"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# 5. Top 5 Processes by Memory Usage
echo -e "\n--- Top 5 Processes by Memory Usage ---"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

echo "========================================================="