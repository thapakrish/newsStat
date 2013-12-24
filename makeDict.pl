#build up a dictionary
@words=();
@single=();
%word_count =();

while (chomp ($line =<>)){
    @fields = split(/\s+/, $line);
    
    foreach $words (@fields) {
	# if the word is in the dictionary, increment its frequency count; 
	# otherwise add it to the dictionary and initialize its frequency count to 1

	if($words =~ /\W*(\w+)\W?/){
	    $word= lc($1);		    	    
	    if (exists($dict{$word})) {
		$dict{$word}++;
	    }
	else {
	    $dict{$word} = 1;
	}	
	}
    }
    
    
#sort, print wordcount    
    foreach (sort { ($dict{$b} cmp $dict{$a}) || ($a cmp $b) } keys %dict) 
	{
    print "$_: $dict{$_}\n";
	}
}
