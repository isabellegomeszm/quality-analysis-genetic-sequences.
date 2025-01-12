#!/bin/bash

# Gene prediction using Prodigal

# Step 1: Download Prodigal

echo "Downloading Prodigal..."
wget https://github.com/hyattpd/Prodigal/releases/download/v2.6.3/prodigal.linux

# Step 2: Make Prodigal executable
chmod a+x prodigal.linux   # Make the Prodigal executable

# Step 3: Run Prodigal
echo "Running Prodigal..."

# Inside the SPAdes output folder
./prodigal.linux -i contigs.fasta -a contigs.AA.fasta -d contigs.NT.fasta -o contigs.gbk

# Alternatively, running it on scaffolds
./prodigal.linux -i scaffolds.fasta -a scaffolds.AA.fasta -d scaffolds.NT.fasta -o scaffolds.gbk

# Step 4: Count the number of coding sequences (CDS)
echo "Counting coding sequences (CDS)..."

# Inside the SPAdes output folder
grep -c ">" scaffolds.AA.fasta   # Count the number of sequences in the AA (amino acid) file
