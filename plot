set terminal pngcairo size 800,600
set output "stokes.png"

set title "Bubble follows the flow"
set xlabel "dp"
set ylabel "St"
plot "stokes.dat" using 1:2 with lines title "U1", \
     "stokes.dat" using 1:3 with lines title "U2"
set output
