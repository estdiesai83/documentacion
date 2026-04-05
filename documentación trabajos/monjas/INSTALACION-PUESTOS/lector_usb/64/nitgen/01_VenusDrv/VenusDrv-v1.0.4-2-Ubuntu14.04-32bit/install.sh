#!/bin/bash

# make kernel driver
./CreateModule 
# first driver install
./install-driver.sh


# second library install
if [ -f /lib/VenusLib.so ]; then
	echo "VenusLib.so already exists"
	exit 1
fi

if [ -f VenusLib.so ]; then
	cp -v VenusLib.so /lib/
else
	echo "VenusLib.so not exist"
	exit 1
fi

if [ -f VenusDrv.conf ]; then
	cp -f VenusDrv.conf /etc/
else
	echo "VenusDrv.conf not exist"
	exit 1
fi

echo "NITGEN USB Fingkey Hamster Library sucessfully installed "
