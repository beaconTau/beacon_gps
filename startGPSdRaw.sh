#!/bin/bash 

source SETUP.sh
sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
sudo killall gpsd




gps0=/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if00-port0
gps1=/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if01-port0
echo "Changing baud rate" 
# this starts as 38.4
stty -F $gps0 38400 
stty -F $gps1 38400 
#change it to 115.2
ubxtool -s 38400 -S 115200 -f $gps0
ubxtool -s 38400 -S 115200 -f $gps1
stty -F $gps0 115200 
stty -F $gps1 115200 

sudo gpsd $gps0 $gps1  -F /var/run/gpsd.sock 
sudo mkdir -p /data/gps  && sudo chown $GPSDATA_USER:$GPSDATA_USER /data/gps

