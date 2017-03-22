testing
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
=begin

#    if!$u{$_}++

#    my $hkey =  $hits2{$data[0]}->{$data[1]};
    $hits2{$data[0]}->{$data[1]};
    #$hits2{$data[0]}->{$data[1]} = [ $data[2], $data[3] , $data[10] ];
    my $line = {
	'pident' => $data[2],
	'alignlength' => $data[3],
	'evalue' => $data[10]
    };
 
    if ($hits2{$data[0]}->{$data[1]}) {
	$arrayref = $hits2{$data[0]}->{$data[1]};
	push @{$arrayref}, $line;
	$count++;
    } else {
	$hits2{$data[0]}->{$data[1]} = [ ($line) ];
	$count2++;
    }

}


#print Dumper(\%hits2);
 #   print "count",$count,"\n";
  #  print "count2",$count2,"\n";
#print scalar($arrayref);
#print Dumper(\$arrayref);

exit;



=begin
    my $values = "$data[2]\t $data[3]\t  $data[10]" ;
    $hits{$data[0]}->{$data[1]} = $values;
#    $hits2{$data[0]}->{$data[1]}->{pident} = $data[2];
#    $hits2{$data[0]}->{$data[1]}->{alignlength} = $data[3];
 #   $hits2{$data[0]}->{$data[1]}->{evalue} = $data[10];
}


foreach my $gene (sort keys %hits) {
        my $ct = 1;
for my $dg ( keys %{ $hits{$gene} }) {
    $ct = 1;

#       print $gene,"\t";
        print $dg,"\t";

#        print  "$gene\t$dg\t$hits{$gene}{$dg}\n";
$ct++;

exit;



sub maxhit {
    my (%data) = @_;
 
    my $max;
    while (my ($key, $value) = each %data) {
        if (not defined $max) {
            $max = $key;
            next;
        }
        if ($data{$max} < $value) {
            $max = $key;
        }
    }
    return $max;
}
 
