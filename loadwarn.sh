#!/bin/bash

# This script sends an email alert if the CPU load is higher than a certain threshold.
# Verify that all the parameters are passed
if [ $# -ne 3 ]; then
    echo "Usage: $(basename $0) <threshold> <from> <to>"
    exit 1
fi

# Set the threshold for CPU load
threshold=$1

# Get the 1-minute load average using the uptime command and extract the first value
load_average=$(uptime | awk -F'[a-z]:' '{print $2}' | cut -d ',' -f 1)
load_average=${load_average%.*}  # Remove decimal part if present

# Get the process list sorted by CPU usage (in descending order)
# Only the first 10 lines are needed
processes=$(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -n 10)

# Check if the load_average is greater than the threshold using integer comparison
if [ "$load_average" -gt "$threshold" ]; then
    # Send an email
    fromName="LoadWarnings"
    subject="High CPU Load Alert"

    message="CPU load is currently $load_average, which is higher than the threshold of $threshold."
    message="$message<br>br>Top 10 processes by CPU usage:<br>$processes"

    echo "Above threshold load !"
    echo "$message" | mail -s "$subject" -aFrom:$fromName\<$2\> $3
fi
