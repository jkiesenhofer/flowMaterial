set terminal pngcairo size 800,600
set output "stokes.png"

set title "Bubble follows the flow"
set xlabel "dp"
set ylabel "St"
plot "stokes.dat" with lines title "μ=0, σ=1"

set output
