#!/bin/bash
# Create index for D. virilis transcriptome. Input parameter is the target folder

mkdir $1
cd $1
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/285/735/GCF_003285735.1_DvirRS2/GCF_003285735.1_DvirRS2_rna.fna.gz
kallisto index GCF_003285735.1_DvirRS2_rna.fna.gz -i d_virilis.idx
