#!/bin/bash -e

source SETUP.sh 
SECS=${1-3600}
now=`date -Is`
ofile_f9p=/data/gps/$now.f9p.ubx
ofile_f9t=/data/gps/$now.f9t.ubx

timeout $SECS ./grab-single-raw.sh $ZEDF9T > $ofile_f9t &
pidf9t=$!
timeout $SECS ./grab-single-raw.sh $ZEDF9P > $ofile_f9p &
pidf9p=$!


cleanup()  {
	echo gzipping;
	gzip $ofile_f9p;
	gzip $ofile_f9t;
	echo done;
}


interrupted() 
{
  echo interrupted ;
  kill $pidf9t;
  kill $pidf9p;
  cleanup;
}

echo "Running for $SECS seconds" 
trap interrupted INT
wait 
cleanup
