#use POSIX;
use Data::Dumper;
#build up a dictionary
@words=();
@single=();
%word_count =();
$word_count=0;


while (chomp ($line =<>)){
    @fields = split(/\s+/, $line);
    
    foreach $words (@fields) {
	# if the word is in the dictionary, increment its frequency count; 
	# otherwise add it to the dictionary and initialize its frequency count to 1

	if($words =~ /\W*(\w+)\W?/){
	    $word= lc($1);		    	    
	    if (exists($dict{$word})) {
		$dict{$word}++;
			    $word_count +=1;
	    }
	else {
	    $dict{$word} = 1;
	    $word_count +=1;
	}	
	}
    }


#get the percentage
foreach my $key (keys %dict) {
	$percent=int($dict{$key} / $word_count * 100);
	if($percent>1){
		$word_freq{$key} = $percent;
		}
}
	
}

#sort, print wordcount    
#    foreach (sort { ($dict{$b} cmp $dict{$a}) || ($a cmp $b) } keys %dict) 
#	{
#    print "$_: $dict{$_}\n";
#	}
	
	
#sort, print wordcount from word_freq    
    foreach (sort { ($word_freq{$b} cmp $word_freq{$a}) || ($a cmp $b) } keys %word_freq) 
	{
	    print "$_: $word_freq{$_}\n";
	}

#much easier this way, without sorting:
#print Dumper(\%word_freq);	

#print $word_count, "\n";	
