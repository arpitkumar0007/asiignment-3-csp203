#!/bin/bash 

awk 'NR==7 { 
    facecream += $2
    facewash += $3
    toothpaste += $4
    bathingsoap += $5
    shampoo += $6
    moisturizer += $7
} 
END { 
    total = facecream + facewash + toothpaste + bathingsoap + shampoo + moisturizer
    facecream_prop = facecream / total
    facewash_prop = facewash / total
    toothpaste_prop = toothpaste / total
    bathingsoap_prop = bathingsoap / total
    shampoo_prop = shampoo / total
    moisturizer_prop = moisturizer / total

    print "facecream_prop=" facecream_prop
    print "facewash_prop=" facewash_prop
    print "toothpaste_prop=" toothpaste_prop
    print "bathingsoap_prop=" bathingsoap_prop
    print "shampoo_prop=" shampoo_prop
    print "moisturizer_prop=" moisturizer_prop
    print "Product totals:"
    print "Face Cream:", facecream
    print "Face Wash:", facewash
    print "Toothpaste:", toothpaste
    print "Bathing Soap:", bathingsoap
    print "Shampoo:", shampoo
    print "Moisturizer:", moisturizer
    print "Total:", total
}' data.dat > proportions.txt

eval $(grep "_prop" proportions.txt)

cat << EOF > ploti.gnu
set terminal pdf
set output 'graph-i.pdf'
set title 'Pie Chart of Product Sales of the month june'
set key out top box
set style fill solid 1.0 border -1

a1 = ${facecream_prop} * 360
a2 = a1 + ${facewash_prop} * 360
a3 = a2 + ${toothpaste_prop} * 360
a4 = a3 + ${bathingsoap_prop} * 360
a5 = a4 + ${shampoo_prop} * 360
a6 = a5 + ${moisturizer_prop} * 360

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

plot NaN title 'facecream' with lines lc rgb "red", \
     NaN title 'facewash' with lines lc rgb "orange", \
     NaN title 'toothpaste' with lines lc rgb "yellow", \
     NaN title 'bathingsoap' with lines lc rgb "forest-green", \
     NaN title 'shampoo' with lines lc rgb "dark-turquoise", \
     NaN title 'moisturizer' with lines lc rgb "blue"
EOF

gnuplot ploti.gnu

