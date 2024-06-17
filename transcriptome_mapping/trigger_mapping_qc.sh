#!/bin/bash
# trigger as `trigger_mapping_qc.sh folder_name sample_R1 sample_R2 kallisto_index species`

mkdir $1
cd $1
fastq1=$2
filtered_fastq1="$(basename -- $fastq1)"
fastq2=$3
filtered_fastq2="$(basename -- $fastq2)"

mkdir filtered_fastq
fastp -i ${fastq1} -I ${fastq2} -o filtered_fastq/filtered_${filtered_fastq1} -O filtered_fastq/filtered_${filtered_fastq2}

mkdir fastqc

fastqc ${fastq1} --outdir fastqc
fastqc ${fastq2} --outdir fastqc
fastqc filtered_fastq/filtered_${filtered_fastq1} --outdir fastqc
fastqc filtered_fastq/filtered_${filtered_fastq2} --outdir fastqc

rm fastp.html
rm -rf filtered_fastq
