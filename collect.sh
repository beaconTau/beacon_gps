#!/bin/bash -e

SECS=${1-3600}

ofile=/data/gps/`date -Is`.ubx 
gpspipe -R "-x $SECS" > $ofile && gzip $ofile 

