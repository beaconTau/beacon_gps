#!/bin/bash 

sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
#sudo killall gpsd

stty -F /dev/ttyO4 57600
sudo gpsd /dev/ttyO4 -F /var/run/gpsd.sock 
