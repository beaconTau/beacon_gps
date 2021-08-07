#! /bin/sh 

if [ ! -d /sys/class/gpio/gpio22 ] ; then 

  echo "GPS GPIO not exported. GPS is off."
  exit 1 

fi

GPSON=`cat /sys/class/gpio/gpio22/value`

echo "GPS: $GPSON"


if [ ! -d /sys/class/gpio/gpio47 ] ; then 

  echo "PPS GPIO not exported. PPS is off."
  exit 1 

fi

PPSON=`cat /sys/class/gpio/gpio47/value`

echo "PPS: $PPSON"

ps aux | grep gpsd 







