#!/bin/bash -e

WHICH=${1-0}
SECS=${2-3600}

ofile=/data/gps/if0${WHICH}-`date -Is`.ubx 
gpspipe -R "-x $SECS" localhost:2947:/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_016BD3C4-if0${WHICH}-port0 > $ofile && gzip $ofile 

