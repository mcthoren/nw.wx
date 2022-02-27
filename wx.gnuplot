# vim: set syntax=gnuplot:
set xtics 7200 rotate by 30 offset -5.7, -2.2
set y2tics 
set mytics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6;
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y%m%d%H%M%S"
set grid
set term pngcairo size 2000, 512 font ",10"

set title "Atmospheric pressure for the Last \\~48 Hours"
set ylabel "Pressure (kPa)"
set y2label "Pressure (kPa)"
set output 'pressure.png'
set format y "%.2f"
set format y2 "%.2f"

WS='/wx1/data/bme680.dat.2-3_day'
NS='/wx_0x0b/data/bme680.dat.2-3_day'
WSPT='/wx1/data/pi_temp.2-3_day'
NSPT='/wx_0x0b/data/pi_temp.2-3_day'
WSDD='/wx1/data/derived.dat.2-3_day'
NSDD='/wx_0x0b/data/derived.dat.2-3_day'

# calibration from https://www.dwd.de/DE/wetter/wetterundklima_vorort/bayern/augsburg/_node.html [kPa]
plot WS using 1:(($9 + 5.900)) title 'WS Atmospheric Pressure (kPa)' with lines linecolor rgb "#ff00ff",\
     NS using 1:(($9 + 5.780)) title 'NS Atmospheric Pressure (kPa)' with lines linecolor rgb "#6000ff"

set format y "%.1f"
set format y2 "%.1f"

set title "Raspberry Pi Temperature for the Last \\~48 Hours"
set ylabel "Pi Temp (°C)"
set y2label "Pi Temp (°C)"
set output 'pitemp.png'
plot WSPT using 1:(($2/1000)) title 'WS Pi Temp (°C)' with lines linecolor rgb "#00ff00" smooth bezier,\
     NSPT using 1:(($2/1000)) title 'NS Pi Temp (°C)' with lines linecolor rgb "#00c040" smooth bezier

set title "Temperature for the Last \\~48 Hours"
set ylabel "Temp (°C)"
set y2label "Temp (°C)"
set output 'exttemp.png'
plot WS using 1:3 title 'WS Temp (°C)' with lines linecolor rgb "#00ff00",\
     NS using 1:3 title 'NS Temp (°C)' with lines linecolor rgb "#00c040"

set title "Temperature and Dew Point for the Last \\~48 Hours"
set output 'extdewtemp.png'
plot WS using 1:3 title 'WS Temp (°C)' with lines linecolor rgb "#00ff00",\
     WSDD using 1:12 title 'WS Dew Point (°C)' with lines linecolor rgb "#00ffc0",\
     NS using 1:3 title 'NS Temp (°C)' with lines linecolor rgb "#00c040",\
     NSDD using 1:12 title 'NS Dew Point (°C)' with lines linecolor rgb "#00c0ff"

set title "Dew Point for the Last \\~48 Hours"
set ylabel "Dew Point (°C)"
set y2label "Dew Point (°C)"
set output 'extdew.png'
plot WSDD using 1:12 title 'WS Dew Point (°C)' with lines linecolor rgb "#00ffc0",\
     NSDD using 1:12 title 'NS Dew Point (°C)' with lines linecolor rgb "#00c0ff"

set title "Heat Index for the Last \\~48 Hours"
set ylabel "Heat Index (°C)"
set y2label "Heat Index (°C)"
set output 'heatindex.png'
plot WSDD using 1:8 title 'WS Heat Index (°C)' with lines linecolor rgb "#ff4000",\
     NSDD using 1:8 title 'NS Heat Index (°C)' with lines linecolor rgb "#ff0040"

set title "Absolute Humidity for the Last \\~48 Hours"
set ylabel "Absolute Humidity (g/m³)"
set y2label "Absolute Humidity (g/m³)"
set output 'abshum.png'
plot WSDD using 1:4 title 'WS Absolute Humidity (g/m³)' with lines linecolor rgb "#00a0c0",\
     NSDD using 1:4 title 'NS Absolute Humidity (g/m³)' with lines linecolor rgb "#0000aa"

set format y "%.2f"
set format y2 "%.2f"

set title "Relative Humidity for the Last \\~48 Hours"
set ylabel "Relative Humidity (%)"
set y2label "Relative Humidity (%)"
set output 'exthum.png'
plot WS using 1:6 title 'WS Relative Humidity (%)' with lines linecolor rgb "#00cc00",\
     NS using 1:6 title 'NS Relative Humidity (%)' with lines linecolor rgb "#009999"

set format y
set format y2

set title "Air Quality Sensor Data for the Last \\~48 Hours"
set ylabel "Air Quality (kOhms)"
set y2label "Air Quality (kOhms)"
set output 'airquality.png'
plot WS using 1:(($12 / 1000)) title 'WS Air Quality Sensor Reading (kOhms)' with lines linecolor rgb "#ff4000",\
     NS using 1:(($12 / 1000)) title 'NS Air Quality Sensor Reading (kOhms)' with lines linecolor rgb "#ff0040"
