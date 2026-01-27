set terminal pngcairo size 800,600
set output "stokes.png"

set title "Behaviour of bubble and particle"
set xlabel "dp, db"
set ylabel "K, Re"

plot "stokes.dat" using 1:2 with lines title "Ua", \
     "stokes.dat" using 1:3 with lines title "Ub", \
     "stokes.dat" using 1:4 with lines title "Uc"#, \
     #"stokes.dat" using 1:5 with lines title "Re"

set output
