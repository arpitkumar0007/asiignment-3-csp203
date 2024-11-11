set terminal pdf
set output 'graph-a.pdf'
set title 'Total Monthly Profit'
set xlabel 'Months'
set ylabel 'Total Profit'
set xtics 1
set xrange [0:13]
set key out top box
plot 'data.dat' using 1:9 ti col w lp lc "blue" lt 5
