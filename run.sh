#!/bin/bash
while sleep 10
do
	if ps aux | grep "/bin/bash.*monitor.sh$"
	then
		echo "running"
	else
		echo "not running. starting..."
		/home/pi/controlHomeDevices/monitor.sh
	fi
done
