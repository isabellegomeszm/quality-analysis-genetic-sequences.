#!/bin/bash

# Functional Annotation using BLAST

# Step 1: Download BLAST
# BLAST compares your protein sequences with pre-existing sequences in a database.

# echo "Downloading BLAST..."
# wget https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.16.0+-x64-linux.tar.gz

# Step 2: Extract the BLAST package
# echo "Extracting BLAST package..."
# tar vxfz ncbi-blast-2.16.0+-x64-linux.tar.gz

# Step 3: Download and rename the database
# I set up the commands to work with HIV-1 related data. The accession number GCF_000864765.1 corresponds to a sequence from the RefSeq database.
# The directory levels where the file is located are organized based on the accession number split into 3-character chunks, meaning the path to access the file is GCF/000/864/765.

echo "Downloading HIV-1 protein database..."
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/864/765/GCF_000864765.1_ViralProj15476/GCF_000864765.1_ViralProj15476_protein.faa.gz

# Step 4: Unzip the downloaded file
echo "Unzipping the downloaded file..."
gunzip GCF_000864765.1_ViralProj15476_protein.faa.gz

# Step 5: Rename the database for easier access
echo "Renaming the database file..."
mv GCF_000864765.1_ViralProj15476_protein.faa hiv-1.fasta

# Step 6: Format the database for BLAST
echo "Formatting the database for BLAST..."
~/ncbi-blast-2.16.0+/bin/makeblastdb -in hiv-1.fasta -dbtype prot

# Step 7: Run BLASTP to annotate the protein sequences
echo "Running BLASTP to annotate protein sequences..."
~/ncbi-blast-2.16.0+/bin/blastp -query contigs.AA.fasta -db hiv-1.fasta -out contigs.AA.blastp.out -num_threads 3

echo "Functional annotation using BLAST completed."
