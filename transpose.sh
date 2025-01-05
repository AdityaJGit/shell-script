#!/bin/bash

# Function to transpose the content of a file
transpose_file() {
    awk '
    {
        # Process each row and store fields in a matrix
        for (i = 1; i <= NF; i++) {
            matrix[i, NR] = $i
        }
        # Track the number of fields and rows
        if (NF > maxCols) maxCols = NF
        maxRows = NR
    }
    END {
        # Iterate over the matrix in a transposed manner
        for (i = 1; i <= maxCols; i++) {
            for (j = 1; j <= maxRows; j++) {
                printf "%s%s", matrix[i, j], (j == maxRows ? ORS : OFS)
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
