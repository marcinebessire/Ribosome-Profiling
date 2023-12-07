# Count reads on CDS

featureCounts \
-T 8 \
-t CDS \
-g gene_id \
-a path/of/Homo_sapiens.GRCh38.108.gtf \
-o CDS_counts_rawfile.txt *_GRCh38_sorted.bam

# Extract GeneID and Sample columns

cut -f 1,7-10 CDS_counts_rawfile.txt > CDS_counts_processed.txt


