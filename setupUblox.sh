#!/bin/bash -e

source SETUP.sh
gps0=localhost:2947:/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if00-port0
gps1=localhost:2947:/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if01-port0


for gps in $gps0 $gps1 ; 
do 
ubxtool -d NMEA  $gps #disable NMEA messages
ubxtool -e BINARY  $gps #enable binary messages

ubxtool -d BEIDOU  $gps
ubxtool -d GALILEO  $gps
ubxtool -d GLONASS  $gps
ubxtool -d SBAS  $gps
ubxtool -e GPS  $gps #enable only GPS constellation

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX  $gps #enable raw measurement messages
ubxtool -e PPS  $gps #enable timpulse0 [pps]
ubxtool -e TP $gps #enable tim-tp message

#ubxtool -w 4 | fgrep RAWX #confirm RAW messaging
#ubxtool -w 4 | fgrep TP

done

