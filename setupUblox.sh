#!/bin/bash -e

source SETUP.sh



ubxtool -d NMEA  ::$ZEDF9T $ZEDF9T_PROTO #disable NMEA messages
ubxtool -e BINARY  ::$ZEDF9T $ZEDF9T_PROTO #enable binary messages

ubxtool -d BEIDOU  ::$ZEDF9T $ZEDF9T_PROTO
ubxtool -e GALILEO  ::$ZEDF9T $ZEDF9T_PROTO
ubxtool -e GLONASS  ::$ZEDF9T $ZEDF9T_PROTO
ubxtool -d SBAS  ::$ZEDF9T $ZEDF9T_PROTO
ubxtool -e GPS  ::$ZEDF9T $ZEDF9T_PROTO 

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX  ::$ZEDF9T $ZEDF9T_PROTO #enable raw measurement messages
ubxtool -e PPS  ::$ZEDF9T $ZEDF9T_PROTO #enable timpulse0 [pps]
ubxtool -e TP ::$ZEDF9T $ZEDF9T_PROTO #enable tim-tp message

ubxtool -d NMEA  ::$ZEDF9P $ZEDF9P_PROTO #disable NMEA messages
ubxtool -e BINARY  ::$ZEDF9P $ZEDF9P_PROTO #enable binary messages

ubxtool -d BEIDOU  ::$ZEDF9P $ZEDF9P_PROTO
ubxtool -e GALILEO  ::$ZEDF9P $ZEDF9P_PROTO
ubxtool -e GLONASS  ::$ZEDF9P $ZEDF9P_PROTO
ubxtool -d SBAS  ::$ZEDF9P $ZEDF9P_PROTO
ubxtool -e GPS  ::$ZEDF9P $ZEDF9P_PROTO 

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX  ::$ZEDF9P $ZEDF9P_PROTO #enable raw measurement messages
ubxtool -e PPS  ::$ZEDF9P $ZEDF9P_PROTO #enable timpulse0 [pps]
ubxtool -e TP ::$ZEDF9P $ZEDF9P_PROTO #enable tim-tp message



ubxtool -e RTCM3 ::$ZEDF9T $ZEDF9T_PROTO 
ubxtool -e NED ::$ZEDF9P $ZEDF9T_PROTO
