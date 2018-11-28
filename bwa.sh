#!/usr/bin/env bash

#bwa mem -t 7 -M -R '@RG\tID:flowcell\tSM:HG00698\tLB:HUMbodXCZAAAPEI-12' \
#  data/GRCh38_full_analysis_set_plus_decoy_hla.fa \
#  data/ERR031924_1.filt.fastq \
#  data/ERR031924_2.filt.fastq > bwamem_with_R.sam

bwa mem -t 7 data/GRCh38_full_analysis_set_plus_decoy_hla.fa \
  data/ERR031924_1.filt.fastq \
  data/ERR031924_2.filt.fastq > bwamem.sam


