#!/bin/bash

# Input and output file names
input_file="input.txt"
output_file="output.txt"

# Check if input file exists
if [[ ! -f $input_file ]]; then
    echo "Error: $input_file not found!"
    exit 1
fi

# Process the input file and reverse each line
while IFS= read -r line; do
    echo "$line" | rev
done < "$input_file" > "$output_file"

# Confirmation message
echo "Reversed content saved to $output_file"
