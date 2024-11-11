set terminal pdf
set output 'graph-h.pdf'
set title 'Product Sales Graph'
set xlabel 'Months'
set ylabel 'Sales'
set key out top box
set xtics ("Jan" 1,"Feb" 2,"Mar" 3,"Apr" 4,"May" 5,"June" 6,"July" 7,"Aug" 8,"Sep" 9,"Oct" 10,"Nov" 11,"Dec" 12)
plot 'data.dat' using 1:5 w lp title "bathingsoap",      'data.dat' using 1:4 w lp title "toothpaste",      'data.dat' using 1:2 w lp title "facecream"
