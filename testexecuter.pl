#!/usr/bun/perl

use strict;
use warnings;
use 5.010;
 
my $file = $ARGV[0];
open my $fh, '<', $file or die("Cannot open file: $file");
chomp(my @lines = <$fh>);
close $fh;

my $successrate = 0;
foreach my $line (@lines){
	if( $line =~ /<testsuite\sname=\"(.*?)\".*tests=\"(\d+)\".*failures=\"(\d+)\"/ ){
		print "Name: $1, Success: ".($2-$3)."/".$2."\n";
		$successrate += $3;
	}
}
exit($successrate);
