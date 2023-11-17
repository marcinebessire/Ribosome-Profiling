#!/bin/bash
git add process_data.sh 
git commit -m "revised"
git push 


cd /data/users/mbessire/RNA_seq/exercise_data/un

# Clip 3' adapter
for x in $(ls -d *.fastq.gz); do
    echo ${x}
    cutadapt \
        -j 4 \
        -a CTGTAGGCACCATCAAT \
        -q 25 \
        --minimum-length 25 \
        --discard-untrimmed \
        -o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
        ${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt
done

# Trim 4 nt (randomized bases) from the 3' end
for x in $(ls -d *_clpd.fastq.gz); do
    echo ${x}
    cutadapt \
        -j 4 \
        -q 25 \
        --cut -4 \
        --minimum-length 25 \
        -o $(basename ${x} .fastq.gz)_tr.fastq.gz \
        ${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt
done

#then perform fastqc with

fastqc -o /data/users/mbessire/RNA_seq/exercise_data/unprocessedWTKO/fastqc2 -f fastq
 *_tr.fastq.gz




