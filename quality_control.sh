#!/bin/bash

module add UHTS/Quality_control/fastqc/0.11.7 #load module first
cd /data/users/mbessire/RNA_seq/exercise_data/unprocessedWTKO #move to directory where to perform fastqc
fastqc -o ./fastqc -f fastq *.fastq.gz #perform fastqc file on unprocessed fastq files



