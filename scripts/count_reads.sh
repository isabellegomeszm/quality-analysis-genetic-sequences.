#!/bin/bash

# Function to calculate the number of reads
count_reads() {
    local file=$1
    echo $(cat $file | wc -l)/4 | bc
}

# Output file
output_file="reads_count.txt"

# Create (or clear) the output file before writing
echo "Reads count results for FASTQ files:" > $output_file
echo "" >> $output_file

# List of FASTQ files
files=(
    "SRR10419884_1.fastq"
    "SRR10419884_2.fastq"
)

# Loop to iterate over the files and count the number of reads
for file in "${files[@]}"; do
    count=$(count_reads $file)
    echo "$file: $count reads" >> $output_file
done

# For compressed files, change the counting function:
   # echo $(zcat yourfile.fastq.gz | wc -l)/4 | bc
