set terminal pngcairo size 800,600
set output "stokes.png"

set xlabel "dp, db"
set ylabel "K"

set xtics 0, 0.00005, 0.0001     # Start, Schritt, Ende
set ytics 0, 1, 7
set mxtics 5
set format x "%.5f"
set multiplot layout 1,2

plot "stokes.dat" using 1:2 with lines title "Ua", \
     "stokes.dat" using 1:3 with lines title "Ub", \
     "stokes.dat" using 1:4 with lines title "Uc"

set ylabel "Re"
set xtics 0, 0.005, 0.01
set ytics 0, 10000, 40000
set mytics 2
plot "stokes.dat" using 1:5 with lines title "Re"


unset multiplot

set output
