#!/usr/bin/perl -w
use strict;


my $tool="java  -jar  trimmomatic.jar PE -phred33 -threads 60";
my $adaptor="../Trimmomatic/adapters/TruSeq3-PE.fa:2:30:10:8:true";
my $part3="LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:75";


opendir FH,"../raw_data";
my @all_file=readdir FH;

foreach my $file(@all_file)
{
    if ($file=~/^H\d+_/ or $file=~/^L\d+_/) 
    {

        print $file,"\n";
        my $sample=$file;
        my $file1=$sample."_1.fq.gz";
        my $file2=$sample."_2.fq.gz";
        my $baseout="-baseout $sample.fq.gz";
        system("$tool ../raw_data/$sample/$file1 ../raw_data/$sample/$file2 $baseout $adaptor $part3");
        
        
    }
    
}
