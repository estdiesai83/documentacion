### **Descargar motionEyeOs para raspberry**

**https://github.com/ccrisan/motioneyeos/releases**

### **Descomprimir imagen descargada**

```
sudo apt-get install xz-utils

unxz file.xz
```



### **Partition Layout**

motionEyeOS uses three partitions:

- a boot partition, FAT32, about 20M, mounted read-only at `/boot`
- a root partition, EXT4, about 180M, mounted read-only at `/`
- a data partition, EXT4, fills up the entire remaining card space, mounted read-write at `/data`

The *boot* and *root* partitions are both overwritten when performing an update (except for the `/boot/config.txt` file which is preserved). Whenever you need to change something on either *root* or *boot* partitions, run the following commands to make them writable:

```
mount -o remount,rw /
mount -o remount,rw /boot
```

The *data* partition contains all the configuration files as well as media files (recorded movies and pictures taken). It is created and formatted at first boot. Wiping out the *data* partition is equivalent to a *factory reset*.

### **Manually Editing Network Configuration**

There's no `/etc/network/interfaces` file. Networking is configured by a few init scripts at`/etc/init.d/`, using simple configuration files.

The ethernet interface will be used if a link is detected (i.e. network cable plugged in). Otherwise the wired connection is skipped.   (Se puede configurar desde el mac creando en /boot/ (en el raiz el archivo static_ip.conf y si lo queremos hacer en raspberry (añadido esther)

The wifi script `/etc/init.d/S35wifi` looks for `/data/etc/wpa_supplicant.conf`; if found, it's used to establish the wifi connection. If this file is absent, it looks for `/boot/wpa_supplicant.conf` and `/etc/wpa_supplicant.conf` (normally created by `writeimage.sh`), in this order, and copies it over to `/data/etc/`, using it thereafter. If none of the files are present, wifi connection is skipped.

The network script `/etc/init.d/S40network` looks for `/data/etc/static_ip.conf`; if found, it's used for configuring the static IP of the *first* connected interface (`wlan0`, `eth0` in this order). If this file is absent, it looks for `/boot/static_ip.conf` and `/etc/static_ip.conf` (normally created by `writeimage.sh`), in this order, and copies it over to `/data/etc`, using it thereafter. If none of the files are present, all the connected interfaces are configured using *DHCP*.

Here's an example of a `static_ip.conf` file:

```
static_ip="192.168.0.3/24"
static_gw="192.168.0.1"
static_dns="8.8.8.8"
```

### **Tweaking motion**

The main motion daemon is (re)started automatically by motionEye when required; it is not started at boot by any init script. The configuration files used by motions can be found at `/data/etc/motion.conf` and `/data/etc/thread-x.conf`, where `x` is the camera number (starting at 1).

You can make changes to these files as you please, but keep in mind that various options corresponding to the settings found in the UI settings panel will be overwritten when applying settings in the UI. However configuration variables that are not covered by the UI are left untouched when settings are applied.

### **Adding Custom Startup Commands**

If you want motionEyeOS run some custom commands at boot, you can create the file `/data/etc/userinit.sh` and fill it up with your commands.

Make sure it does not block (terminate any blocking command with a `&` to run it in the background). Any output can be safely redirected to `/var/log/your_file`; the file will be persisted on the data partition, in the `log` directory. `echo`-ing will print to the console (and thus the line will appear in `/var/log/boot.log`).

There's no need to add a shebang (i.e. `#!/bin/sh`) at the beginning of the file and there is no need to make it executable. It will be run with the `/bin/bash` interpreter anyway.

### **Running Commands At Regular Intervals (Cron Support)**

If you need to run a certain command at regular intervals, you can use the builtin *cron* support. To configure *cron*, log in using SSH and run the following command:

```
EDITOR=nano crontab -e
```

The *crontab* file is initially empty. After adding your crontab lines, hit `Ctrl-O`, `Enter`, `Ctrl-X` to save and exit the editor. If you're not familiar with the crontab file format, see [cron configuration file](http://en.wikipedia.org/wiki/Cron#Configuration_file) on Wikipedia.

For example, the following line updates the IP address on [freedns.afraid.org](http://freedns.afraid.org/) dynamic DNS service, every 5 minutes:

```
3-59/5 * * * * sleep 20; curl -S "http://freedns.afraid.org/dynamic/update.php?Rry68SBhp93GbgzL7T57FEb6kK9djtvjXGTDEADBEEF=" >> /var/log/dyndns.log 2>&1 &
```

### **Loading Custom Modules At Startup**

If you wish for a certain module to be loaded at startup (because for some reason it doesn't get loaded automatically, or because you need to supply extra arguments when loading it), you can simply create the file `/data/etc/modules` and add the module name, along with any optional arguments to it.

Additionally, if you want to further customize the kernel modules on your system, you can create and edit the `/data/etc/modprobe.conf` file, by adding standard *modprobe* directives to it. For instance, blacklisting a module can be achieved by adding `blacklist <your-module>` to this file.

### **Adding A RTC Module**

These boards usually don't have an integrated real-time clock and therefore the system relies on NTP or HTTP to obtain the current date/time. However a RTC module can be connected to the I2C bus of the board. For a `DS1307` RTC module, follow these steps (you may need to adapt them for other modules):

1. Log in remotely via SSH/putty and create/edit the file `/data/etc/modules`:

   ```
   nano /data/etc/modules
   ```

2. ​	Add the following line, save and exit the editor:

   ```
   rtc-ds1307
   ```

3. Create/edit the file `/data/etc/userinit.sh`:

   ```
   nano /data/etc/userinit.sh
   ```

4. ​	Add the following lines, save and exit the editor:

   ```
   echo ds1307 0x68 > /sys/class/i2c-adapter/i2c-1/new_device
   sleep 5
   hwclock -s
   ```

5. ​	Reboot:

   ```
   reboot
   ```



# static_ip.conf

Calin Crisan edited this page · [3 revisions](https://github.com/ccrisan/thingos/wiki/static_ip.conf/_history)

​	
 	

## 		**File 	Location And Role**

​		The 	file lives at `/data/etc/static_ip.conf`. 	It can be provisioned using `/boot/static_ip.conf` and 	uses `/etc/static_ip.conf` as 	a default.

​		If 	the file is present at all, values defined by it are used to 	control the static IP configuration of the system.

## 		**File 	Format**

​		This 	is a simple shell script that should contain 	only `NAME="value"` lines. 	The file is *sourced* by 	the network init script.

## 		**Available 	Variables**

##### 		`**STATIC_IP**`

​		If 	set, will assign the defined static IP to the *first* enabled 	network adapter, in this order: `wlan0` and `eth0`. 	If both wireless and ethernet connections are enabled, the ethernet 	connection will always use DHCP.

​		The 	format is the following: `ip/mask` (e.g. `192.168.1.16/24`).

##### 		`**STATIC_GW**`

​		If 	set, will be used as the default gateway (e.g. `192.168.1.1`).

##### 		`**STATIC_DNS**`

​		If 	set, will be used to set the DNS server (e.g. `8.8.8.8`).