#!/bin/bash -e

source SETUP.sh


for gps in $ZED9P $ZED9T ; 
do 
ubxtool -d NMEA  ::$gps #disable NMEA messages
ubxtool -e BINARY  ::$gps #enable binary messages

ubxtool -d BEIDOU  ::$gps
ubxtool -d GALILEO  ::$gps
ubxtool -d GLONASS  ::$gps
ubxtool -d SBAS  ::$gps
ubxtool -e GPS  ::$gps #enable only GPS constellation

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX  ::$gps #enable raw measurement messages
ubxtool -e PPS  ::$gps #enable timpulse0 [pps]
ubxtool -e TP ::$gps #enable tim-tp message

#ubxtool -w 4 | fgrep RAWX #confirm RAW messaging
#ubxtool -w 4 | fgrep TP

done

ubxtool -e RTCM3 ::$ZEDF9T 
ubxtool -e NED ::$ZEDF9P 
