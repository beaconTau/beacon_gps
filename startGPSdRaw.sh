#!/bin/bash 

sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
sudo killall gpsd




gps0=/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_016BD3C4-if00-port0
gps1=/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_016BD3C4-if01-port0
echo "Changing baud rate" 
ubxtool -s 38400 -S 57600 -f $gps0
ubxtool -s 38400 -S 57600 -f $gps1
stty -F $gps0 57600 
stty -F $gps1 57600 

sudo gpsd $gps0 $gps1  -F /var/run/gpsd.sock 
sudo mkdir -p /data/gps  && sudo chown beacon:beacon /data/gps

