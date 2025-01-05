#!/bin/bash

# Function to transpose the content of a file
transpose_file() {
    awk '
    {
        for (i = 1; i <= NF; i++) {
            a[i, NR] = $i
        }
    }
    NF > maxNF { maxNF = NF }  # Track maximum number of fields in a row
    END {
        for (i = 1; i <= maxNF; i++) {  # Loop through columns
            for (j = 1; j <= NR; j++) {  # Loop through rows
                printf "%s%s", a[i, j], (j == NR ? ORS : OFS)
            }
        }
    }
    ' OFS=' ' "$1"
}

# Input file
input_file="file.txt"

# Check if the file exists
if [[ ! -f $input_file ]]; then
    echo "Error: $input_file not found!"
    exit 1
fi

# Transpose and output to console
transpose_file "$input_file"
