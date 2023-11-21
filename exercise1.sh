git add process_data.sh 
git commit -m "revised"
git push 

# Download samples

prefetch --option-file samples.txt

# sample.txt is a file containing list of samples:

# SRR9596295.sra
# SRR9596296.sra
# SRR9596300.sra
# SRR9596310.sra
# SRR9596303.sra
# SRR9596304.sra

# Move the .sra files in one directory

mv source/file/path/file.sra destination/file/path/

# Convert *.sra files to *.fastq files

fastq-dump --gzip SRR*.sra

# Rename the files

mv ./SRR9596295.fastq.gz ./Biever_Somata_Poly_1.fastq.gz
mv ./SRR9596296.fastq.gz ./Biever_Somata_Poly_2.fastq.gz
mv ./SRR9596300.fastq.gz ./Biever_Somata_Poly_3.fastq.gz
mv ./SRR9596310.fastq.gz ./Biever_Neuropil_Poly_1.fastq.gz
mv ./SRR9596303.fastq.gz ./Biever_Neuropil_Poly_2.fastq.gz
mv ./SRR9596304.fastq.gz ./Biever_Neuropil_Poly_3.fastq.gz

