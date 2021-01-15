#!/usr/bin/perl -w
use strict;

system("CNCI.py -f novel_transcript_seq.fa -o CNCI_coding_potencial.txt -p 10 -m ve");

system("cpat.py -g novel_transcript_seq.txt  -d human_model  -x human_hexamer -o CPAT_coding_potencial.txt");

system("CPC2.py -i novel_transcript_seq.txt -o CPC_coding_potencial.txt");
