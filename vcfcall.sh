#!/usr/bin/env bash

which samtools
which bcftools
which tabix

# Clean up, sort and index with samtools
echo ---- Running samtools fixmate ----
samtools fixmate -@ 6 -O bam bwamem.sam bwamemfixmate.bam

echo ---- Running samtools sort ----
samtools sort -@ 6 -m 1400M -O bam -o sorted.bam -T ./sorttemp bwamemfixmate.bam

echo ---- Running samtools index ----
samtools index -@ 6 sorted.bam

# Call variants with mpileup

echo ---- Runnin samtools mpileup and bcftools call ----
samtools mpileup -ugf data/GRCh38_full_analysis_set_plus_decoy_hla.fa sorted.bam | \
  bcftools call -vmO z -o HG00698_ERR031924.vcf.gz

# Index

echo ---- Running tabix ----
tabix -p vcf HG00698_ERR031924.vcf.gz

