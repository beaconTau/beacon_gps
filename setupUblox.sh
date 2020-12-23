#!/bin/bash -e


ubxtool -d NMEA #disable NMEA messages
ubxtool -e BINARY #enable binary messages

ubxtool -d BEIDOU
ubxtool -d GALILEO
ubxtool -d GLONASS
ubxtool -d SBAS
ubxtool -e GPS #enable only GPS constellation

#ubxtool -p CFG-GNSS #confirm enabled constellations
ubxtool -e RAWX #enable raw measurement messages
ubxtool -e PPS #enable timpulse0 [pps]
ubxtool -e TP #enable tim-tp message

#ubxtool -w 4 | fgrep RAWX #confirm RAW messaging
#ubxtool -w 4 | fgrep TP


