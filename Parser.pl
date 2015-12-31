use strict;
use warnings;

my $concept = "";
my $date = "";
my $time = "";
my $hgnc = "NA";
my $protocol = "";
my $from = "";

while(<>)
{
	$_ =~ s/\r?\n$//;
#print "$_\n";
#print "Inside While loop";
	if(/^From:\s*(.*)$/)
	{
		if($from ne "")
		{
			print "$concept,$date,$time,$hgnc,$protocol\n";
			$concept = "";
			$date = "";
			$time = "";
			$hgnc = "NA";
			$protocol = "";
		}
		$from = $1;
	}
	elsif(/^Sent:\s*\w*,\s\w*\s\d*,\s\d{4}\s(.*)$/)
	{
		$time = $1;
	}
	elsif(/^Date:\s*(.*)$/)
	{
		$date = $1;
	}
	elsif(/^HUGO Marker Code: (.*)$/)
	{
		$hgnc = $1;
	}
	elsif(/^Concept: (.*)$/)
	{
		$concept = $1;
	}
	elsif(/^NCI Trial ID:	\s*(.*)$/)
	{
		$protocol = $1;
	}
}
if($from ne "")
{
	print "$concept,$date,$time,$hgnc,$protocol\n";
}
