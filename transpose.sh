#!/bin/bash

# Check if file exists
if [ ! -f "file.txt" ]; then
    echo "file.txt not found!"
    exit 1
fi

# Transpose the file using awk
awk '
{
    for (i = 1; i <= NF; i++) {
        matrix[i, NR] = $i
    }
    if (NF > maxCols) {
        maxCols = NF
    }
    maxRows = NR
}
END {
    for (i = 1; i <= maxCols; i++) {
        for (j = 1; j <= maxRows; j++) {
            printf "%s%s", matrix[i, j], (j == maxRows ? ORS : OFS)
        }
    }
}
' OFS=' ' file.txt
