#!/bin/bash -e

source SETUP.sh 
WHICH=${1-0}

gpspipe -w localhost:2947:/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if0${WHICH}-port0 

