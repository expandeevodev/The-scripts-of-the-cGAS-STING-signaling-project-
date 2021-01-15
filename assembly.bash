#transcriptome assembly
stringtie  mapped_reads.sorted.bam  -m 300 -A fileout_abundance -l sample -p 30 -G gene_annotation.gtf  -o fileout;
