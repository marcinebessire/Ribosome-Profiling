cd /data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA

module load  Bowtie/1.3.1-GCC-10.3.0 

for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
--norc \
~/data/users/mbessire/RNA_seq/exercise_data/bowtie_files/GRCh38_APPRIS_CDS_18 \
-q ${x} \
-S $(basename ${x} .fastq)_GRCh38_APPRIS_CDS.sam 2> $(basename ${x} .fastq)_GRCh38_APPRIS_CDS_log.txt; done
