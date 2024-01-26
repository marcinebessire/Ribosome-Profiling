# debugging 

setwd("/Users/marcinebessire/Desktop/Project")
file_path <- "/Users/marcinebessire/Desktop/Project/riboseqc.R"
source(file_path)
# Step 3: Comment out line 2283
system("sed -i '' '2283s/^/# /' riboseqc.R")

# Step 4: Edit line 2694
system("sed -i '' '2694s/n_transcripts = length(unique(gtfdata$transcript_id))/n_transcripts = length(unique(na.omit(gtfdata$transcript_id)))/' RiboseQC/R/riboseqc.R")

# Step 5: Save your changes
# Note: This step is manual. Save the changes in RStudio.

# Step 6: Restart R (Cmd/Ctrl + Shift + 0 or Session > Restart R)
cat("Restart R in RStudio (Cmd/Ctrl + Shift + 0 or Session > Restart R).\n")

# Step 7: Remove current installation of RiboseQC
remove.packages("RiboseQC")

# Step 8: Navigate to the directory containing correct RiboseQC code
setwd("RiboseQC")

# Step 9: Build the package
system("R CMD build .")

# Step 10: Install the modified package
install.packages("RiboseQC_0.99.0.tar.gz", repos = NULL, type = "source")

# Step 11: Try QC analysis again
cat("Now, try to perform the QC analysis again using the modified version of RiboseQC.\n")

# In R studio (for example)
setwd("/Users/marcinebessire/Desktop/Project/files_for_R")


# Installation of the package (to be done only once!)
install.packages("devtools")

library(usethis)
library("devtools")

install_github(repo = "ohlerlab/RiboseQC")

###### Analysis part ######

# Load the package
library(RiboseQC)

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = "/Users/marcinebessire/Desktop/Project/files_for_R",
                         twobit_file = "/Users/marcinebessire/Desktop/Project/files_for_R/GRCh38.dna.primary_assembly.2bit",
                         gtf_file = "/Users/marcinebessire/Desktop/Project/files_for_R/Homo_sapiens.GRCh38.108.gtf",
                         scientific_name = "Homo.sapiens",
                         annotation_name = "GRCh38",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("/Users/marcinebessire/Desktop/Project/files_for_R/RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_GRCh38_sorted.bam",
                "/Users/marcinebessire/Desktop/Project/files_for_R/RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_GRCh38_sorted.bam",
                "/Users/marcinebessire/Desktop/Project/files_for_R/RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_GRCh38_sorted.bam",
                "/Users/marcinebessire/Desktop/Project/files_for_R/RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_GRCh38_sorted.bam")

load_annotation("/Users/marcinebessire/Desktop/Project/files_for_R/Homo_sapiens.GRCh38.108.gtf_Rannot")

###### QC plots ######

RiboseQC_analysis(annotation_file ="/Users/marcinebessire/Desktop/Project/files_for_R/Homo_sapiens.GRCh38.108.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "/Users/marcinebessire/Desktop/Project/files_for_R/*.html",
                  sample_names = c("WT_Rep1", "WT_Rep2",
                                   "KO_Rep1", "KO_Rep2"),
                  dest_names = c("WT_Rep1", "WT_Rep2",
                                 "KO_Rep1", "KO_Rep2"),
                  write_tmp_files = F)
# Capture session information
session_info <- capture.output(print(sessionInfo()))

# Specify the filename for saving the session information
filename <- "session_info.txt"

# Write the captured information to the specified file
writeLines(session_info, filename)

# Print a message indicating where the file is saved
cat("Session information saved to", filename, "\n")
