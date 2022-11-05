#!/bin/bash 

sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
sudo killall gpsd



#if we have REVE, set speed to 57600 
if [[ -f /REV ]] ; 
then 
  rev=`cat /REV` 
  echo "rev is E" 
  if [[ $rev == "E" ]] 
  then 
    echo "Changing baud rate" 
    ubxtool -s 9600 -S 57600 /dev/ttyGPS
  fi
fi

stty -F /dev/ttyO4 57600
sudo gpsd /dev/ttyO4 -F /var/run/gpsd.sock 
sudo mkdir -p /data/gps 
