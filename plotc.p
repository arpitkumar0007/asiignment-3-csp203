set terminal pdf
set output 'graph-c.pdf'
set title 'Sales of Facecream'
set xlabel 'Months'
set ylabel 'Units Sold'
set key out top box
set boxwidth 1.5 absolute
set style data histograms
set style fill solid
plot 'data.dat' using 2:xtic(1) ti col lc "red"
