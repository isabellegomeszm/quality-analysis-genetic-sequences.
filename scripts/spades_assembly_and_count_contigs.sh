#!/bin/bash

# Running SPAdes for genome assembly using paired-end reads

# Parameters for SPAdes
# -1: File with forward paired-end reads
# -2: File with reverse paired-end reads
# -o: Directory to store all the resulting files (required)
# -t: Number of threads to use for parallel processing
# -m: Can be used to set a memory limit or some size threshold

spades.py --isolate -1 SRR10419884_1_trimmed.fastq -2 SRR10419884_2_trimmed.fastq -o SRR10419_spades_output -t 4 -m 10

# Count the number of contigs generated by SPAdes
echo "Counting the number of contigs generated by SPAdes..."

# Get the count of contigs in the generated contigs.fasta file
grep -c ">" SRR10419_spades_output/contigs.fasta
