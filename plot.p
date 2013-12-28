set terminal pdf
set output 'wordFreq.pdf'
set size square
set ylabel "Word Frequency"
set xlabel "Word"
set boxwidth 0.5
set style fill solid
set xtics nomirror rotate by -45 font ",18"
plot "newData.txt" using 2:xtic(1) with boxes