#!/bin/bash
#acenderSeForaPor
#apagarApos
source /home/pi/controlHomeDevices/config.sh
source /home/pi/controlHomeDevices/funcoes.sh
ultimoComando=nenhum
last=$(date +%s)
while sleep $intervaloSleep
do
	source status
	echo $enabled
	if [ "$enabled" = true ]
	then
		now=$(date +%s)
		diff=$(( $now-$last ))
		for ip in "${check[@]}"
		do
			if ping -c 1 $ip &> /dev/null
			then
				echo "encontrou"
				if [ $diff -ge $acenderSeForaPor ]
				then
					if [ "$ultimoComando" != acendeu ]
					then
						acender
						echo "acender"
						ultimoComando=acendeu
					fi
				fi
				break
			else
				echo "não encontrou"
				if [ $diff -ge $apagarApos ]
				then
					if [ "$ultimoComando" != apagou ]
					then
						apagar
						echo "apagar"
						ultimoComando=apagou
					fi
				fi
			fi
		done
	fi
done
