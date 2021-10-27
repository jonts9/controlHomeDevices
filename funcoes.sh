#!/bin/bash
source /home/pi/controlHomeDevices/config.sh
acender() {
	for i in "${acender[@]}"
	do
		curl "http://$i/cm?cmnd=Power%20On" &> /dev/null
	done
}
apagar() {
	for i in "${apagar[@]}"
	do
		curl "http://$i/cm?cmnd=Power%20Off" &> /dev/null
	done
}
