#!/usr/bin/perl -w
use strict;

my $ref="gene_annotaton.grf";

use Parallel::ForkManager;




opendir FH,"../";
     
my @tmp_all_file=readdir FH;
my %all_segment_file;
foreach my $file(@tmp_all_file)
{
   if($file=~/_sorted.bam$/ )
   {
      $all_segment_file{$file}++;
   }
}
     
print scalar(keys %all_segment_file),"\n";
     
 
my $pm = new Parallel::ForkManager(25);
        
        
        
foreach my $inputfile(sort keys %all_segment_file)
{
   $pm-> start and next;
            
   print $inputfile,"\n";
           
   my $outputfile="result_cor_".$inputfile.".txt";
   print $outputfile,"\n";

   my $sample=(split("_",$inputfile))[0];

   my $out=$sample.".txt";

   system("junction_annotation.py -i ../$inputfile -r $ref -o $sample");
           
            
            
   $pm->finish;
           
            
}
         
$pm->wait_all_children;
   
    
  