# Analyze unmapped reads in each sorted BAM file
module load UHTS/Analysis/samtools/1.8
module load UHTS/Analysis/BEDTools/2.29.2
cd /data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA

for x in $(ls -d *_sorted.bam); do
    echo "Analyzing unmapped reads in ${x}"
    
    # Extract unmapped reads
    samtools view -b -f 4 ${x} > $(basename ${x} .bam)_unmapped.bam
    
    # Optional: Convert unmapped reads to FASTQ format
    bedtools bamtofastq -i $(basename ${x} .bam)_unmapped.bam -fq $(basename ${x} .bam)_unmapped.fastq
    
    # Optional: Count unmapped reads
    unmapped_count=$(samtools view -c -f 4 ${x})
    echo "Number of unmapped reads: ${unmapped_count}"
done
