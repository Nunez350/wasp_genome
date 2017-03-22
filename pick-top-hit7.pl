jeff test
testing2
#!/usr/bin/env perl
use strict;
use Data::Dumper;
use warnings;
use List::Util qw(max);
#use List::UtilsBy qw(max_by);
#die "Usage: $0 <Gene call file> <subject file> <BLAST file>\n" unless @ARGV == 1;
#my ($gene_call, $subject_file, $blast_file) =  @ARGV;
use Bio::SeqIO;
my %hits2;
my %hits;
my $arrayref;    
   my $count;
   my $count2;
my %uniq;
my $blast_file = shift @ARGV;

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



#open (my $top_blast, "<", $blast_top) or die "Cannot Open: $blast_top\n";

#while(my $line= <$top_blast>){
print Dumper(\%uniq);
exit;


#using bioseq to open files (Jeff)
#lets get this done
