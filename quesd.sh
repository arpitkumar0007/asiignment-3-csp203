#!/bin/bash
 
file="data.dat"
output="graph-h.pdf"
 
products=("facecream" "facewash" "toothpaste" "bathingsoap" "shampoo" "moisturizer")
totals=()

for i in {1..6}
do
   col=$((i+1))
   total=$(awk -v col=$col '{sum += $col} END {print sum}' "$file")
   totals+=($total)
done

topindex=($(for i in "${!totals[@]}"; do echo "$i ${totals[i]}"; done | sort -k2 -nr | head -1 | awk '{print $1}'))

gnuplot="plotd.p"
cat << EOF > $gnuplot
set terminal pdf
set output 'graph-d.pdf'
set title 'Product Sales Graph'
set xlabel 'Months'
set ylabel 'Sales'
set key out top box
set xtics ("Jan" 1,"Feb" 2,"Mar" 3,"Apr" 4,"May" 5,"June" 6,"July" 7,"Aug" 8,"Sep" 9,"Oct" 10,"Nov" 11,"Dec" 12)
plot '$file' using 1:$((${topindex[0]}+2)) w lp lc "blue" title "${products[${topindex[0]}]}"
EOF
 
# Run gnuplot to generate the graph
gnuplot $gnuplot
