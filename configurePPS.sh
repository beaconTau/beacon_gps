#! /bin/sh 

DUTY=${1-1000} #duty cycle
NSECS=${2-0}   # the delay
ANTCABLEDELAY=${3-2}  # the antenna cable delay
WHICHTP=${4-0}  #which time pulse


echo "Configuring PPS with: "
echo "  DUTY CYCLE us = ${DUTY}" 
echo "  DELAY_NS  = ${NSECS}" 
echo "  ANTCABLEDELAY  = ${ANTCABLEDELAY}" 
echo "  WHICHTP  = ${WHICHTP}" 


#            class id  sel ver  res[2]  antdel[2] grpdl[2]       period[4]     lckperiod[4]     pulselenratio   lckpulselenratio   delay              flags
CMD=`printf "0x06,0x31,0x$WHICHTP,0x01,0x0,0x0,0x%x,0x%x,0x0,0x0,0x40,0x42,0x0f,0x0,0x40,0x42,0x0f,0x0,0x0,0x0,0x0,0x0,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x77,0x0,0x0,0x0" "$(( $ANTCABLEDELAY & 0xff))"  "$((($ANTCABLEDELAY >> 8) & 0xff))"     "$(( $DUTY & 0xff ))"  "$(( ($DUTY >>8 ) & 0xff))"  "$(( ($DUTY >> 16 ) & 0xff))"  "$(( ($DUTY >> 24) & 0xff ))" "$(( $NSECS & 0xff ))"  "$(( ($NSECS >>8 ) & 0xff))"  "$(( ($NSECS >> 16 ) & 0xff))"  "$(( ($NSECS >> 24) & 0xff ))" `

echo $CMD
ubxtool -c $CMD

