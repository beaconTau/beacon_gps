#! /bin/bash

. SETUP.sh

device=${1-$ZEDF9P}

echo "?WATCH={\"json\":true,\"device\":\"$device\"};" | nc localhost 2947

