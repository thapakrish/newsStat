use strict;
use warnings;
use LWP::Simple;
use Benchmark;

my $start = new Benchmark;

open(MYFILE, '>>data.txt');
for (my $num = 9999; $num < 10015; $num++) {
my $webpage=get "http://archives.myrepublica.com/portal/index.php?action=news_details&news_id=$num";

print "Grabbing story # ", $num, "\n";


#Get the year, month, and day of the story
my ($year, $month,$day) = $webpage =~ /(\d{4})-(\d{2})-(\d{2})/igs;
#print $year, $month, $day, "\n";

#Get heading
$webpage =~ /bodynewsheading\"\>(.*?)\</igs;
my $heading = $1;
$heading =~ s/^\s+|\s+$//g; 

#Get content
$webpage =~ /\<span style\=\"font-weight\: bold\;\">(.*?)\<\/p/igs;
my $content=$1;
#strip story origin
$content =~ s/(.*?)\,(.*?)\>\:(.*?)/$3/;

#strip line breaks,numbers, and others
#$content =~ s/(\<br\/\>)|(\<br\/)|(\<\/p\>) | (\d)//g;
$content =~ s/(\<(.*?)\>)|(\<br\/)|(\d)//g;


#print $content, "\n";

print MYFILE $content . "\n";
#print $content . "\n";
#print $originate . ", " . $month .", " . $day .", " . $year ."\n";

}
close(MYFILE);
my $end = new Benchmark;
my $diff = timediff($end,$start);
print "Time taken was ", timestr($diff, 'all'), " seconds";
