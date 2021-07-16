#!/bin/bash -e

if [ ! -d /sys/class/gpio/gpio22 ]; then echo 22 > /sys/class/gpio/export; sleep 0.1;  fi

echo low > /sys/class/gpio/gpio22/direction
