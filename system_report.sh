#!/bin/bash

# Define the output file
OUTPUT_FILE="system-report.txt"

# Clear the file if it already exists, or create it if it does not
> "$OUTPUT_FILE"

echo "========================================" >> "$OUTPUT_FILE"
echo "        LINUX SYSTEM REPORT" >> "$OUTPUT_FILE"
echo "        Generated on: $(date)" >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 1. Hostname
echo "### HOSTNAME ###" >> "$OUTPUT_FILE"
hostname >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 2. Kernel Version
echo "### KERNEL VERSION ###" >> "$OUTPUT_FILE"
uname -r >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 3. Disk Usage
echo "### DISK USAGE ###" >> "$OUTPUT_FILE"
df -h >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 4. Memory Usage
echo "### MEMORY USAGE ###" >> "$OUTPUT_FILE"
free -m >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 5. Top Running Processes (sorted by CPU usage)
echo "### TOP RUNNING PROCESSES ###" >> "$OUTPUT_FILE"
# Using 'ps' instead of 'top' provides cleaner, non-interactive output for text files
ps -eo pid,user,%cpu,%mem,command --sort=-%cpu | head -n 15 >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "========================================" >> "$OUTPUT_FILE"
echo " Report generation complete." >> "$OUTPUT_FILE"
echo "========================================" >> "$OUTPUT_FILE"

# Notify the user in the terminal
echo "System report successfully saved to $OUTPUT_FILE."
