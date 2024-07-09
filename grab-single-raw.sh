#! /bin/bash

. SETUP.sh

device=${1-$ZEDF9P}

echo "?WATCH={\"raw\":2,\"device\":\"$device\"};" | nc localhost 2947

