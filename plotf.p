set terminal pdf size 8 ,6
set output 'graph-f.pdf'
set title 'All sales data product-wise'
set xlabel 'Products'
set ylabel 'Sales'
set style fill solid 0.5
set boxwidth 0.4 relative
set style histogram columnstacked gap 2
set style data histogram
set key out top box
set xtics rotate by -45
plot 'data.dat' using 2 ti col, '' using 3 ti col,'' using 4 ti col,'' using 5 ti col,'' using 6 ti col,'' using 7:key(1) ti col
