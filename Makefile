#
.PHONY: clean

data.txt: getStory.pl
	perl getStory.pl
	perl makeDict.pl < data.txt > newData.txt
#removes : character from $1 of newData.txt
# To check: awk '{print $1}' newData.txt 
	perl -p -i -e 's/\://g' newData.txt 	
	
plot:
	gnuplot plot.p

clean:
	rm data.txt 
	rm newData.txt
	rm wordFreq.pdf