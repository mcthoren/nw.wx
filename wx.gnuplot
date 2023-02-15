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
# set colors classic
set term pngcairo size 2000, 512 font ",10"

set title "Atmospheric pressure for the Last \\~48 Hours"
set ylabel "Pressure (kPa)"
set y2label "Pressure (kPa)"
set output 'pressure.png'
set format y "%.2f"
set format y2 "%.2f"

WS='/wx1/data/bme680.dat.2-3_day'
NS='/wx_0x0b/data/bme680.dat.2-3_day'
IS='/wx0/wx/data/bme680.dat.2-3_day'
WSPT='/wx1/data/pi_temp.2-3_day'
NSPT='/wx_0x0b/data/pi_temp.2-3_day'
WSDD='/wx1/data/derived.dat.2-3_day'
NSDD='/wx_0x0b/data/derived.dat.2-3_day'
SPPT='/wx8/data/solar_power.2-3_day'
LWPT='/wx/data/v2_light.dat.2-3_day'
OLWPT='/wx7/data/light_levels.2-3_day'
IPWPT='/wx0/dev/data/particle.dat.2-3_day'
OPWPT='/wx5/data/particle.dat.2-3_day'
PWPT='/wx0/power_weather/data/power.2-3_day'
PWPT='/wx0/power_weather/data/power.24_hours'
MQGWPT='/wx0/mqs/data/gas_levels.2-3_day'

# calibration from:
# https://www.dwd.de/DE/wetter/wetterundklima_vorort/berlin-brandenburg/berlin_tempelhof/_node.html [kPa]
plot IS using 1:(($9 + 0.69)) title 'Indoor Atmospheric Pressure (kPa)' with lines linecolor rgb "#00f0f0",\
     WS using 1:(($9 + 0.7)) title 'Balcony Atmospheric Pressure (kPa)' with lines linecolor rgb "#ff00ff",\
     NS using 1:(($9 + 0.58)) title 'Window Atmospheric Pressure (kPa)' with lines linecolor rgb "#6000ff"

set format y "%.1f"
set format y2 "%.1f"

set title "Raspberry Pi Temperatures for the Last \\~48 Hours"
set ylabel "Pi Temp (°C)"
set y2label "Pi Temp (°C)"
set output 'pitemp.png'
plot WSPT using 1:(($2/1000)) title 'Balcony Pi Temp (°C)' with lines lt 6 lw 2 smooth bezier,\
     NSPT using 1:(($2/1000)) title 'Window Pi Temp (°C)' with lines lc rgb "#00ffff" lw 2 smooth bezier,\
     SPPT using 1:12 title 'Solar Power Pi Temp (°C)' with lines lt 3 lw 2 smooth bezier,\
     LWPT using 1:7 title 'Light WXv2 Pi Temp (°C)' with lines lc rgb "#f1f100" lw 2 smooth bezier,\
     OLWPT using 1:13 title 'Light WXv1 Pi Temp (°C)' with lines lc "orange" lw 2 smooth bezier,\
     PWPT using 1:15 title 'Power WX Pi Temp (°C)' with lines lc "magenta" lw 2 smooth bezier,\
     IPWPT using (timecolumn(1, "%Y-%m-%dT%H:%M:%SZ")):5 title 'Indoor Particle WX Pi Temp (°C)' with lines lc "green" lw 2 smooth bezier,\
     OPWPT using (timecolumn(1, "%Y-%m-%dT%H:%M:%SZ")):5 title 'Outdoor Particle WX Pi Temp (°C)' with lines lc "web-green" lw 2 smooth bezier
     # MQ gasses are currently on the same pi as indoor particle weather.
     # MQGWPT using (timecolumn(1, "%Y-%m-%dT%H:%M:%SZ")):51 title 'MQ Gasses WX Pi Temp (°C)' with lines lt 10 lw 2 smooth bezier

set title "Temperature for the Last \\~48 Hours"
set ylabel "Temp (°C)"
set y2label "Temp (°C)"
set output 'exttemp.png'
plot WS using 1:3 title 'Balcony Temp (°C)' with lines linecolor rgb "#00ff00",\
     NS using 1:3 title 'Window Temp (°C)' with lines linecolor rgb "#00c040"

set title "Temperature, Dew Point, and Wet-Bulb Temperature for the Last \\~48 Hours"
set output 'extdewtemp.png'
plot WS using 1:3 title 'Balcony Temp (°C)' with lines linecolor rgb "#00ff00",\
     WSDD using 1:12 title 'Balcony Dew Point (°C)' with lines linecolor rgb "#00ffc0",\
     WSDD using 1:17 title 'Balcony Web-Bulb Temp (°C)' with lines linecolor rgb "#00aac0",\
     NS using 1:3 title 'Window Temp (°C)' with lines linecolor rgb "#00c040",\
     NSDD using 1:12 title 'Window Dew Point (°C)' with lines linecolor rgb "#00c0ff",\
     NSDD using 1:17 title 'Window Wet-Bulb Temp (°C)' with lines linecolor rgb "#00c0aa"

set title "Dew Point for the Last \\~48 Hours"
set ylabel "Dew Point (°C)"
set y2label "Dew Point (°C)"
set output 'extdew.png'
plot WSDD using 1:12 title 'Balcony Dew Point (°C)' with lines linecolor rgb "#00ffc0",\
     NSDD using 1:12 title 'Window Dew Point (°C)' with lines linecolor rgb "#00c0ff"

set title "Wet-Bulb Temp for the Last \\~48 Hours"
set ylabel "Wet-Bulb Temp (°C)"
set y2label "Wet-Bulb Temp (°C)"
set output 'extwetbulb.png'
plot WSDD using 1:17 title 'Balcony Wet-Bulb Temp (°C)' with lines linecolor rgb "#00aaff",\
     NSDD using 1:17 title 'Window Wet-Bulb Temp (°C)' with lines linecolor rgb "#00ffff"

set title "Heat Index for the Last \\~48 Hours"
set ylabel "Heat Index (°C)"
set y2label "Heat Index (°C)"
set output 'heatindex.png'
plot WSDD using 1:8 title 'Balcony Heat Index (°C)' with lines linecolor rgb "#ff4000",\
     NSDD using 1:8 title 'Window Heat Index (°C)' with lines linecolor rgb "#ff0040"

set title "Absolute Humidity for the Last \\~48 Hours"
set ylabel "Absolute Humidity (g/m³)"
set y2label "Absolute Humidity (g/m³)"
set output 'abshum.png'
plot WSDD using 1:4 title 'Balcony Absolute Humidity (g/m³)' with lines linecolor rgb "#00a0c0",\
     NSDD using 1:4 title 'Window Absolute Humidity (g/m³)' with lines linecolor rgb "#0000aa"

set format y "%.2f"
set format y2 "%.2f"

set title "Relative Humidity for the Last \\~48 Hours"
set ylabel "Relative Humidity (%)"
set y2label "Relative Humidity (%)"
set output 'exthum.png'
plot WS using 1:6 title 'Balcony Relative Humidity (%)' with lines linecolor rgb "#00cc00",\
     NS using 1:6 title 'Window Relative Humidity (%)' with lines linecolor rgb "#009999"

set format y
set format y2

set title "Air Quality Sensor Data for the Last \\~48 Hours"
set ylabel "Air Quality (kOhms)"
set y2label "Air Quality (kOhms)"
set output 'airquality.png'
plot WS using 1:(($12 / 1000)) title 'Balcony Air Quality Sensor Reading (kOhms)' with lines linecolor rgb "#ff4000",\
     NS using 1:(($12 / 1000)) title 'Window Air Quality Sensor Reading (kOhms)' with lines linecolor rgb "#ff0040"
