#!/usr/bin/env perl
use strict;
use Data::Dumper;
use warnings;
use List::Util qw(max);
use Bio::SeqIO;
#use List::UtilsBy qw(max_by);
#die "Usage: $0 <Gene call file> <subject file> <BLAST file>\n" unless @ARGV == 1;
#my ($gene_call, $subject_file, $blast_file) =  @ARGV;


my ($blast_file, $gene_call) =  @ARGV;
my %hits2;
my %hits;
my $arrayref;    
   my $count;
   my $count2;
my %uniq;

open BLAST, "<" . $blast_file  or die "Can't open file: $!";

while ( <BLAST>) {
    chomp;
    my @data = split;
    $uniq{$_}++;    
 
    my $line = {
        'pident' => $data[2],
        'alignlength' => $data[3],
        'evalue' => $data[10]
    };
}
close BLAST;
print Dumper(\%uniq);
#################opening gene cal file and storing sequence id and length as key value pairs
#we will later divide the sequence length by the drosophila sequence to get the percent that matched.

open GENECALL, "<" . $gene_call;#  or die "Can't open file: $!";






exit;


#using bioseq to open files (Jeff)
#lets get this done
#open (my $top_blast, "<", $blast_top) or die "Cannot Open: $blast_top\n";
