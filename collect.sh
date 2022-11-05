#!/bin/bash -e

SECS=${1-3600}

gpspipe -R "-x $SECS" > /data/gps/`date -Is`.ubx 

