#!/usr/bin/perl -w
use strict;




my $link="../passed_reads"; #reads that passed the quality control step
my $genome_index="human_genome_index"; # the human genomes indexed using Hisat2
opendir FH,$link;
my @all_file=readdir FH;
my %sample;
foreach my $file(@all_file)
{
   if($file=~/^H\d+/)
    {
        
       my $sample=$file;
       $sample{$sample}++;
    }
}
foreach my $sample(sort keys %sample)
{
       

        my $out=$sample;
        my $out_sam_file=$out.".sam";
         my $file1=$out."_1.fq.gz"; 
         my $file2=$out."_2.fq.gz";
         my $file1_loci=$link."/".$sample."/".$file1;
         my $file2_loci=$link."/".$sample."/".$file2;
       
        
      system("hisat2 -p 40  -k 5  -dta  -x $genome_index -1 $file1_loci -2 $file2_loci -S $out_sam_file");
}
