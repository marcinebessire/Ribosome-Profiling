# For the "undesired" RNAs

bowtie-build GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb.fa GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb

# For the genome

bowtie-build GRCh38.dna.primary_assembly.fa GRCh38.dna.primary_assembly

# For the transcriptome

bowtie-build GRCh38_APPRIS_CDS_18.fa GRCh38_APPRIS_CDS_18

#The downloaded transcriptome FASTA (GRCh38_APPRIS_CDS_18.fa) comes in multi-line format. For mapping purposes this is fine.
#However, in order to generate codon occupancy plots we require this file to be in single-line format.

awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' < GRCh38_APPRIS_CDS_18.fa > GRCh38_APPRIS_CDS_18_SingleLine.fa

