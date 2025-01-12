#!/bin/bash

# Script for collecting, filtering, and converting HIV sequences using the SRA Toolkit and Fasterq-dump

# Step 1: Collect SRA data for HIV
# Download the SRA Toolkit
# echo "Downloading the SRA Toolkit..."
# wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.1.1/sratoolkit.3.1.1-ubuntu64.tar.gz

# Extract the downloaded file
# echo "Extracting the SRA Toolkit..."
# tar xvfz sratoolkit.3.1.1-ubuntu64.tar.gz

# echo "SRA Toolkit downloaded and extracted successfully."


# This command searches the SRA (Sequence Read Archive) for sequences related to HIV.
echo "Searching for HIV sequencing data in SRA..."
~/sratoolkit.3.1.1-ubuntu64/bin/esearch -db sra -query "HIV" | ~/sratoolkit.3.1.1-ubuntu64/bin/efetch -format runinfo > sra_runinfo_HIV.csv
echo "SRA data collected and saved in sra_runinfo_HIV.csv"
echo "Press [Enter] to continue..."
read

# Step 2: Filter the results to include only paired-end sequences, viral genomes, and WGS type
# Here you filter the results collected in the previous step.
echo "Filtering sequences to include only paired-end, viral, and WGS data..."
grep -e "PAIRED" sra_runinfo_HIV.csv | grep -e "VIRAL RNA" | grep -e "WGS" > paired_end_runs_genome_wgs.csv
echo "Filtering completed. Results saved in paired_end_runs_genome_wgs.csv"
echo "Press [Enter] to continue..."
read

# Step 3: Display the top 5 sequences with the highest "spots" values
echo "Displaying the top 5 sequences with the highest spots values..."
# Adjust the column number (6) as needed (the "spots" column might be in a different position).

head -n 1 paired_end_runs_genome_wgs.csv  # Display the header of the CSV file
echo "Displaying the top 5 sequences with the highest spots..."
sort -t, -k6,6nr paired_end_runs_genome_wgs.csv | head -n 6  # Sorts in descending order by spots number and shows the top 5
echo "Press [Enter] to continue..."
read

# Step 4: Download and convert the sequence to FASTQ format using fasterq-dump (SRA Tookit)
# Here, we use the fasterq-dump command to download the sequence in FASTQ format.
echo "Downloading and converting the SRR10419884 sequence to FASTQ format..."
chmod +x fasterq-dump   # Makes the 'fasterq-dump' tool executable
fasterq-dump SRR10419884 --split-3 --outdir /path/to/save/files/
echo "Conversion to FASTQ completed. Files saved in the specified directory."
echo "Press [Enter] to continue..."
read

echo "Process completed. All steps have been executed."
