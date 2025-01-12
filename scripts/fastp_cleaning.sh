#!/bin/bash

# Create the directory for trimmed files
mkdir -p trimmed

# Forward fastq files
files1=(
    "SRR10419884_1.fastq"
    # Add more files here as needed
)

# Reverse fastq files
files2=(
    "SRR10419884_2.fastq"
    # Add more files here as needed
)

# Loop to process all pairs of files
for i in "${!files1[@]}"; do
    # Defining the input files
    file1="${files1[$i]}"
    file2="${files2[$i]}"
    
    # Check if both files exist
    if [[ -f "$file1" && -f "$file2" ]]; then
        # Running fastp for each pair of files (one report generated)
        ~/fastp --detect_adapter_for_pe --overrepresentation_analysis --correction --cut_right --thread 2 \
        --html "trimmed/report_${file1%.fastq}.html" \
        -i "$file1" -I "$file2" \
        -o "trimmed/${file1%.fastq}_trimmed_1.fastq" -O "trimmed/${file2%.fastq}_trimmed_2.fastq"
        
        echo "Processed: $file1 and $file2"
    else
        echo "Error: File $file1 or $file2 not found!"
    fi
done
