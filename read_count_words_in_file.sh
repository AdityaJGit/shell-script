#!/bin/bash

# Check if the file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Read the file and count word occurrences
input_file=$1
tr -c '[:alnum:]' '[\n*]' < "$input_file" | tr 'A-Z' 'a-z' | grep -v '^$' | sort | uniq -c | sort -nr | head -n 5