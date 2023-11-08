#!/bin/bash

# Set the threshold for CPU load
threshold=$1

# Get the 1-minute load average using the uptime command and extract the first value
load_average=$(uptime | awk -F'[a-z]:' '{print $2}' | cut -d ',' -f 1)
load_average=${load_average%.*}  # Remove decimal part if present

# Check if the load_average is greater than the threshold using integer comparison
if [ "$load_average" -gt "$threshold" ]; then
    # Send an email
    fromName="LoadWarnings"
    subject="High CPU Load Alert"

    message="CPU load is currently $load_average, which is higher than the threshold of $threshold."

    echo "Above threshold load !"
    echo "$message" | mail -s "$subject" -aFrom:$fromName\<$2\> $3
fi
