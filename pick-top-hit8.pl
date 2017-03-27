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

#my ($blast_file, $gene_call, $anotherSeqFile) = shiftx @ARGV;   #Jeff: I added other sequence file, feel free to change the name

my $seqio  = Bio::SeqIO->new( '-format' => 'fasta' , -file => 'gene-call_test_file.pep');
my $seqobj = $seqio->next_seq();

while (<$seqio>){
print $seqobj;
}
=begin
my $gene_call = shift @ARGV;   #Jeff: I added other sequence file, feel free to change the name
my $fasta = Bio::Seq->new(-file => $gene_call, -format =>'fasta' );
my $in = $fasta->next_seq();


foreach  my $len ($in->length()){
    print $len;
}
exit;










while (<$fasta>) { 
    my $len = $fasta->id();
    print $len;


}

#my $in = Bio::SeqIO->new(-file=>$gene_call, -format=>'fasta');
#my $in = Bio::AlignIO->new(-file=>$gene_call, -format=>'fasta');

my $aln= $in->next_aln();
while (<$in>) {
    foreach my $seq ($aln->each_seq) {
	my $id = $seq->id();
	print $id;
    }
}
	

  
    



#    my $len =$fasta->length();
#    foreach my $len ($fasta->next_seq()) {;
#    print $len;
#    }
 #   if ($hits{$data[0]}->{$data[1]}) {
#	foreach my $seq (@data) {
	
	
	
	#}
	
  



#    $GClen{$seq->display_id} = $seq->length;
	
#$seqobj->length()            # length
#	    $seqobj->desc();             # description
#	    $seqobj->primary_id();


##	print $data[0],"\n";
#print Dumper(\%uniq);
#print Dumper(\%hits);
#################opening gene call file and storing sequence id and length as key value pairs
#we will later divide the sequence length by the drosophila sequence to get the percent that matched.

#open GENECALL, "<" . $gene_call;#  or die "Can't open file: $!";






exit;


#using bioseq to open files (Jeff)
sub GCopen{ # GCopen(file, optional format--default fasta).  returns( hash{gene x} : length)   
    
    #veriables
    my $gene_call = shift or die "input gene_call"; my $fm = shift // "fasta";  my %GClen;
    my $pepIO =Bio::SeqIO->new(-file=> "$gene_call", -format=> "$fm");
    
    #store into hash
    while (my $seq = $pepIO->next_seq){
            $GClen{$seq->display_id} = $seq->length;
    } 
    return %GClen;    
} # end sub

#calling
my %GClen = GCopen($gene_call); 
my %otherLen= GCopen($anotherSeqFile);



#open (my $top_blast, "<", $blast_top) or die "Cannot Open: $blast_top\n";
=cut
