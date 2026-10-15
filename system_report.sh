#!/bin/bash

OUTPUT_FILE="system-report.txt"
 
> "$OUTPUT_FILE"

echo "_______________________________________" >> "$OUTPUT_FILE"
echo "        LINUX SYSTEM REPORT" >> "$OUTPUT_FILE"
echo "        Generated on: $(date)" >> "$OUTPUT_FILE"
echo "_______________________________________" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
 
echo "### HOSTNAME ###" >> "$OUTPUT_FILE"
hostname >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
 
echo "### KERNEL VERSION ###" >> "$OUTPUT_FILE"
uname -r >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "### DISK USAGE ###" >> "$OUTPUT_FILE"
df -h >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "### MEMORY USAGE ###" >> "$OUTPUT_FILE"
free -m >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "### TOP RUNNING PROCESSES ###" >> "$OUTPUT_FILE"
ps -eo pid,user,%cpu,%mem,command --sort=-%cpu | head -n 15 >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "____________________________" >> "$OUTPUT_FILE"
echo " Report generation complete." >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"

# Notify the user in the terminal
echo "System report successfully saved to $OUTPUT_FILE."
