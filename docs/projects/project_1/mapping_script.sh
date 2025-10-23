#!/bin/bash

module load hisat2 samtools

for i in {41..46}
do 
  base="SRR320761${i}"
  
  echo ">>> Processing $base"
  
  hisat2 -q -p 12 \
  --summary-file "./reads_mapping/summary_${base}.txt" \
  -x "./ref_genome/index_hisat2/human" \
  -1 "./clean_reads/${base}_1_clean.fastq.gz" \
  -2 "./clean_reads/${base}_2_clean.fastq.gz" \
| samtools sort -@ 12 -o ./reads_mapping/${base}.sorted.bam
  
done