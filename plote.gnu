set terminal pdf
set output 'graph-e.pdf'
set title 'Pie Chart of Product Sales'
set key out top box
set style fill solid 1.0 border -1

a1 = 0.122775 * 360
a2 = a1 + 0.0659272 * 360
a3 = a2 + 0.248932 * 360
a4 = a3 + 0.405961 * 360
a5 = a4 + 0.0904786 * 360
a6 = a5 + 0.0659272 * 360

set xrange [-1:1]
set yrange [-1:1]
set size square

set obj 1 circle arc [0:a1] fc rgb "red"
set obj 2 circle arc [a1:a2] fc rgb "orange"
set obj 3 circle arc [a2:a3] fc rgb "yellow"
set obj 4 circle arc [a3:a4] fc rgb "forest-green"
set obj 5 circle arc [a4:a5] fc rgb "dark-turquoise"
set obj 6 circle arc [a5:a6] fc rgb "blue"

set obj 1 circle at 0,0 size 1 front
set obj 2 circle at 0,0 size 1 front
set obj 3 circle at 0,0 size 1 front
set obj 4 circle at 0,0 size 1 front
set obj 5 circle at 0,0 size 1 front
set obj 6 circle at 0,0 size 1 front

plot NaN title 'facecream' with lines lc rgb "red",      NaN title 'facewash' with lines lc rgb "orange",      NaN title 'toothpaste' with lines lc rgb "yellow",      NaN title 'bathingsoap' with lines lc rgb "forest-green",      NaN title 'shampoo' with lines lc rgb "dark-turquoise",      NaN title 'moisturizer' with lines lc rgb "blue"
