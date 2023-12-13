
./Codon_occupancy_cal.sh \
/data/users/mbessire/RNA_seq/exercise_data/indices/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA/RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
/data/users/mbessire/RNA_seq/exercise_data/indices/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA/RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep2_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
/data/users/mbessire/RNA_seq/exercise_data/indices/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA/RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
/data/users/mbessire/RNA_seq/exercise_data/indices/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/mbessire/RNA_seq/exercise_data/removed_undesired_RNA/RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep2_Codon_occupancy.txt
