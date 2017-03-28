#!/usr/bin/env perl
use strict;
use Data::Dumper;
use warnings;
use List::Util qw(max);
use Bio::SeqIO;
use Bio::Seq;
use Bio::AlignIO;
#use List::UtilsBy qw(max_by);
#die "Usage: $0 <Gene call file> <subject file> <BLAST file>\n" unless @ARGV == 1;

my ($blast_file, $gene_call, $anotherSeqFile) =  @ARGV;   #Jeff: I added other sequence file, feel free to change the name
my @data;
my %hits;
my %uniq;

open BLAST, "<" . $blast_file  or die "Can't open file: $!";
while ( <BLAST>) {
    chomp;
    @data = split;
    $hits{$data[0]}->{$data[1]} = {
        'pident' => $data[2],
        'alignlength' => $data[3],
        'evalue' => $data[10]
    };
}
close BLAST;
#print Dumper(\%hits);
#GCopen($gene_call);
my %GClen = GCopen($gene_call); 
foreach my $ph (keys %hits){
    foreach my $phv ( keys %{ $hits{$ph} } ){

  print join "\t", $ph, $phv, %{$hits{$ph}{$phv}};
  print "\n";
#    print $phv,"\n";
    }
}
#       foreach my $seq (@data) {
exit;

#using bioseq to open files (Jeff)
sub GCopen{ # GCopen(file, optional format--default fasta).  returns( hash{gene x} : length)   
    #variables
    my $gene_call = shift or die "input gene_call"; my $fm = shift // "fasta";  my %GClen;
    my $pepIO =Bio::SeqIO->new(-file=> "$gene_call", -format=> "$fm");
    
    #store into hash
    while (my $seq = $pepIO->next_seq){
	$GClen{$seq->display_id} = $seq->length;
#	print $seq->length,"\n";
   } 
    return %GClen;    
} # end sub

#calling

my %otherLen= GCopen($anotherSeqFile);



#print Dumper(\%hits);
#################opening gene call file and storing sequence id and length as key value pairs
#we will later divide the sequence length by the drosophila sequence to get the percent that matched.

