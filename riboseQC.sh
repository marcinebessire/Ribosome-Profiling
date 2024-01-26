#!/bin/bash

# Convert genome FASTA file to 2bit format

# Download fatoTwoBit:

#make this on your local computer!
# For linux (http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit)
# For Mac (http://hgdownload.soe.ucsc.edu/admin/exe/macOSX.x86_64/faToTwoBit)
# Other platforms (http://hgdownload.soe.ucsc.edu/admin/exe/)

# Make sure you have faToTwoBit in you PATH.

# Usage (https://genome.ucsc.edu/goldenPath/help/blatSpec.html#faToTwoBitUsage)

faToTwoBit GRCh38.dna.primary_assembly.fa GRCh38.dna.primary_assembly.2bit

