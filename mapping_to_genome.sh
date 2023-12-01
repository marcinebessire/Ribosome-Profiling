# Alignment using Bowtie

for x in $(ls -d *RNA.fastq); do
    echo ${x}; \
    bowtie \
        -S \
        -t \
        -p 4 \
        -v 1 \
        -m 1 \
        --best \
        --strata \
        /path/to/annotation/GRCh38.dna.primary_assembly \
        -q ${x} \
        2> $(basename ${x} .fastq)_GRCh38_log.txt | \
    samtools view \
        -h \
        -F 4 \
        -b > $(basename ${x} .fastq)_GRCh38.bam
done

# Sort the BAM files

for x in $(ls -d *.bam); do
    echo ${x}; \
    samtools sort \
        -@ 4 \
        ${x} \
        -o $(basename ${x} .bam)_sorted.bam
done

# Remove the unsorted BAM files

rm *GRCh38.bam

