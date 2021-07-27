#! /bin/sh 

if [ ! -d /sys/class/gpio/gpio22 ] ; then 

  echo "GPS GPIO not exported. GPS is off."
  exit 1 

fi

GPSON=`cat /sys/class/gpio/gpio22/value`

if [ $GPSON == "1" ] 
  echo "GPS IS ON!"
else 
  echo "GPS is OFF ($GPSON)" 
  exit 1
fi



if [ ! -d /sys/class/gpio/gpio47 ] ; then 

  echo "PPS GPIO not exported. PPS is off."
  exit 1 

fi

PPSON=`cat /sys/class/gpio/gpio47/value`

if [ $PPSON == "1" ] 
  echo "PPS IS ON!"
else 
  echo "PPS is OFF ($PPSON)" 
  exit 1
fi


ps aux | ps gpsd 







