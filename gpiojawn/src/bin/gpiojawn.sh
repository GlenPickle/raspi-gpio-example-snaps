#! /bin/sh

#
# echo ${GPIO} >/sys/class/gpio/export
# echo out >/sys/class/gpio/gpio${GPIO}/direction
#

set -e

GPIO=18

while [ ! -f /sys/class/gpio/gpio${GPIO}/value ]
do
	sleep 1
done

if [ "(cat /sys/class/gpio/gpio${GPIO}/direction)" != "out" ]
then
	echo out >/sys/class/gpio/gpio${GPIO}/direction
fi

while true; do
	echo "1" >/sys/class/gpio/gpio${GPIO}/value
	sleep 1
	echo "0" >/sys/class/gpio/gpio${GPIO}/value
	sleep 1
done
