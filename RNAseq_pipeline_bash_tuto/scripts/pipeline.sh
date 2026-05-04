#!/bin/bash

SECONDS=0 

# change working directory

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cd "$PROJECT_DIR"


# STEP 1 Run fastQC 

#fastqc data/demo.fastq -o data/

# STEP 2 Run trimmomatic to trim reads with poor quality

#trimmomatic SE data/demo.fastq data/demo_trimmed.fastq TRAILING:10 -phred33
#echo "Trimmomatic finished running!"

#fastqc data/demo_trimmed.fastq -o data/

# STEP 3 Align to the genome with HISAT2

#mkdir HISAT2 

#wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz

# run alignment
#hisat2 -q --rna-strandness R -x grch38_genome/grch38/genome -U data/demo_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
#echo "HISAT2 finished running!"

# STEP 4 Quantification with featureCounts

#get gtf
#wget https://ftp.ensembl.org/pub/release-115/gtf/homo_sapiens/Homo_sapiens.GRCh38.115.gtf.gz

featureCounts -S 2 -a Homo_sapiens.GRCh38.115.gtf -o demo_featurecounts.txt HISAT2/demo_trimmed.bam
echo "featureCounts finished running!"