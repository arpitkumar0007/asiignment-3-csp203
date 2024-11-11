set terminal pdf
set output 'graph-g.pdf'
set title 'Comparison Between Shampoo and moisturizer'
set xlabel 'Months'
set ylabel 'Sales'
set key out top box
set boxwidth 0.9 relative
set style data histograms
set style fill solid
plot 'data.dat' using 6:xtic(1) ti col lc "blue",'' using 7:xtic(1) ti col lc "cyan"
