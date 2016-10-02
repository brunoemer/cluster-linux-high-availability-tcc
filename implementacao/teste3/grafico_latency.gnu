set term postscript enhanced 'Arial' 15
set encoding iso_8859_1
set ou 'grafico_latency.eps'

set title  'Latencia'
set ylabel 'Tempo (ms)'

set format y "%f"
set ytics format "%.3f"

plot 'grafico-latency-186.195.16.13.txt' u 1 w lines notitle

