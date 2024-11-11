set terminal pdf
set output 'graph-b.pdf'
set title 'Monthly Products Sales'
set xlabel 'Months'
set ylabel 'Units Sold'
set key out top box
set xtics 1
set xrange [0:13]
plot 'data.dat' using 1:2 ti col w lp lt 7 lc "red",'' using 1:3 ti col w lp lt 7 lc "blue",'' using 1:4 ti col w lp lt 7 lc "green",'' using 1:5 ti col w lp lt 7 lc "cyan",'' using 1:6 ti col w lp lt 7 lc "pink",'' using 1:7 ti col w lp lt 7 lc "purple"
