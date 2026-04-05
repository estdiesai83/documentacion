#!/bin/sh
# first uninstall driver
./uninstall-driver.sh

#remove user module
echo "uninstalling library........."
if [ -f /lib/VenusLib.so ]; then
	rm -f /lib/VenusLib.so
fi
#remove Device conf. file
if [ -f /etc/VenusDrv.conf ]; then
	rm -f /etc/VenusDrv.conf
fi
echo "library un-installed successfully"
