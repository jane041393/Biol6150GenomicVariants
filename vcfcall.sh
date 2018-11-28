#!/usr/bin/env bash

which samtools
which bcftools
which tabix

# Clean up, sort and index with samtools
samtools fixmate -O bam bwamem.sam bwamemfixmate.bam

samtools sort -O bam -o sorted.bam -T ./sorttemp bwamemfixmate.bam

samtools index sorted.bam

# Call variants with mpileup

samtools mpileup -ugf data/GRCh38_full_analysis_set_plus_decoy_hla.fa sorted.bam | \
  bcftools call -vmO z -o HG00698_ERR031924.vcf.gz

# Index
tabix -p vcf HG00698_ERR031924.vcf.gz

