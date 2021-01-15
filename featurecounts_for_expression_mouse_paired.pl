#!/usr/bin/perl -w
use strict;



use Parallel::ForkManager;

my %all_segment_file;
opendir FH,"../";
my @all_file=readdir FH;

foreach my $file(sort @all_file)
{
    
    if($file=~/^L/ )
    {
     
     #my @tmp_all_file=readdir FH;
     
        $all_segment_file{$file}++;
        
     }
     
     
}
print scalar(keys %all_segment_file),"\n";

     
     
     
     
 
   
        
my $pm = new Parallel::ForkManager(20);
        
        
        
foreach my $inputfile(sort keys %all_segment_file)
{
    $pm-> start and next;
            
    print $inputfile,"\n";
           
    my $fileout=$inputfile."_expression";
    print $fileout,"\n";
            
            

    my $blastCommand = "featureCounts  -C -s 0  -p -T 30  -a mouse_gene_annotation.gtf  -o $fileout ../$inputfile ";

    if(system($blastCommand))
    {
        print "featureCounts not work!","\n";
    }
    else
    {
        print "featureCounts begin....","\n";
    }
            
            
    $pm->finish;
           
            
}
         
$pm->wait_all_children;
   
  