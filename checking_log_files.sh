# Check log files for each alignment job
cd /data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA

for x in $(ls -d *_GRCh38_log.txt); do
    echo "Checking log file for ${x}"
    
    # Display lines indicating reads that didn't align
    grep "did not" ${x}
done
