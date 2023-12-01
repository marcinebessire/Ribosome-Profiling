cd /data/users/mbessire/RNA_seq/exercise_data/unprocessedWTKO

for x in $(ls -d *tr.fastq.gz); do
    echo ${x}; \
    gunzip -cd ${x} | \
    bowtie \
        -S \
        -t \
        -p 4 \
        /data/users/mbessire/RNA_seq/exercise_data/bowtie_files_undesired/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb \
        - \
        --un $(basename ${x} .fastq.gz)_no_r_t_sno_sn_RNA.fastq 2> $(basename ${x} .fastq.gz)_no_r_t_sno_sn_RNA_log.txt > /dev/null
done

