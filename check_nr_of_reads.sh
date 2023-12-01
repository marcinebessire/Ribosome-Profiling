# Check the number of reads mapped to the genome
module load UHTS/Analysis/samtools/1.8
cd /data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA

for x in $(ls -d *_sorted.bam); do
    echo "Checking alignment statistics for ${x}"
    
    # Display alignment statistics using samtools flagstat
    samtools flagstat ${x} > "${x}_alignment_stats.txt"
done

