#!/bin/sh
KER_VER=`uname -r`
DRIVER_PATH="/lib/modules/$KER_VER/kernel/drivers/usb/misc/"
device="nitgen"
echo "uninstalling driver......."
#remove stale node
rm -f /dev/${device}[0-7]

# uninstall driver from kernel space
/sbin/rmmod VenusDrv.ko
  
#delete module from source
	if [ -f $DRIVER_PATH/VenusDrv.ko ]; then
		rm -f $DRIVER_PATH/VenusDrv.ko
	fi
#remove headerfile
	if [ -f /usr/include/linux/VenusDrv.h ]; then
		rm -f /usr/include/linux/VenusDrv.h
	fi
        if [ -f /etc/udev/rules.d/99-Nitgen-VenusDrv.rules ] ; then
                rm -f /etc/udev/rules.d/99-Nitgen-VenusDrv.rules
        fi

/sbin/depmod

echo "driver un-installed successfully"
