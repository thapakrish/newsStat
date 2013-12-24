#use strict;
#user warnings;
use LWP::Simple;

open(MYFILE, '>>data.txt');
for ($num = 10000; $num < 10001; $num++) {
$webpage=get "http://archives.myrepublica.com/portal/index.php?action=news_details&news_id=$num";

#Get the year, month, and day of the story
my ($year, $month,$day) = $webpage =~ /(\d{4})-(\d{2})-(\d{2})/igs;
#print $year, $month, $day, "\n";

#Get heading
$webpage =~ /bodynewsheading\"\>(.*?)\</igs;
$heading = $1;
$heading =~ s/^\s+|\s+$//g; 

#Get content
$webpage =~ /\<span style\=\"font-weight(.*?)\<\/div/igs;
$content=$1;
$content =~/\>(.*?)\,/;
$originate = $1;
$content =~ s/(.*?)\>\:(.*?)/\2/g;
$content =~ s/(\<br\/\>)|(\<br\/)|(\<\/p\>) | (\d)//g;

print MYFILE $content . "\n";
#print $content . "\n";
#print $originate . ", " . $month .", " . $day .", " . $year ."\n";

}
close(MYFILE);

