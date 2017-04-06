#!/usr/bin/env perl
use strict;
use Data::Dumper;
use warnings;
use List::Util qw(max);
use Bio::SeqIO;
use Bio::Seq;
use Bio::AlignIO;
use 5.010;
use Scalar::Util qw(looks_like_number);
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
    if ($data[2] > 70.00 && $data[10] <= .003){
	$hits{$data[0]}->{$data[1]} = {
        'pident' => $data[2],
        'alignlength' => $data[3],
        'evalue' => $data[10]
    }
    };
#    say join "\t",$data[0], $data[1], $hits{$data[0]}->{$data[1]}->{'alignlength'};
 #   print "\n";
}
close BLAST;

#using bioseq to open files (Jeff)
sub GCopen{ # GCopen(file, optional format--default fasta).  returns( hash{gene x} : length)   
    #variables
    my $gene_call = shift or die "input gene_call"; my $fm = shift // "fasta";  my %GClen;
    my $pepIO =Bio::SeqIO->new(-file=> "$gene_call", -format=> "$fm");
    
    #store into hash
    while (my $seq = $pepIO->next_seq){
	$GClen{$seq->display_id} = $seq->length;
#	print $seq->display_id,"\t",$seq->length,"\n";
   } 
    return \%GClen;    
} # end sub
my $GCLen = GCopen($gene_call);

#calling


#my %fraction;      #added by Jeff.  calculating the   (align length / gene call length)
#foreach my $geneN (keys %hits){
#    foreach my $id (keys $hits{$geneN}){
#	say join "\t", $geneN,"d",$id,"dd",$hits{$geneN}{$id}{'alignlength'};
	 #   $fraction{$geneN}{$id}=$hits{$geneN}{$id}{'alignlength'}/$GCLen{$geneN};
	#    print $fraction{$geneN}{$id}," = $hits{$geneN}{$id}{'alignlength'} / $GCLen{$geneN} = $id alignlength / $geneN length, \t pident $hits{$geneN}{$id}{'pident'} \n\n";
	 #    print "$id, $geneN,\t\t", $hits{$geneN}{$id}{'alignlength'}/$GCLen{$geneN},"\n\n";
#	}
#    } 
#} 
my %fraction;
foreach my $geneN (keys %hits){
    foreach my $geneP (keys %$GCLen){
	if ($geneN =~ /$geneP$/){
	    foreach my $id (keys $hits{$geneN}){

       say join "\t", "blast-match: $geneN","align-len: $hits{$geneN}{$id}{'alignlength'}", "geneCall: $geneP", "seq-len: $GCLen->{$geneP}", "perc-overlap:", $hits{$geneN}{$id}{'alignlength'}/$GCLen->{$geneP};
	   my $match = $geneN;
	    }
	}
    }
}




#print Dumper(\%hits);
#################opening gene call file and storing sequence id and length as key value pairs
#we will later divide the sequence length by the drosophila sequence to get the percent that matched.
=cut
