#!/bin/bash

# Transpose a file
transpose_file() {
    awk 
    {
        for (i = 1; i <= NF; i++) {
            a[i, NR] = $i
        }
    }
    NF > maxNF { maxNF = NF }
    END {
        for (i = 1; i <= maxNF; i++) {
            for (j = 1; j <= NR; j++) {
                printf "%s%s", a[i, j], (j == NR ? ORS : OFS)
            }
        }
    }
    ' OFS='  $1
}

# Input file
input_file= file.txt

# Transpose and output to console
transpose_file $input_file
