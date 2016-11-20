#!/bin/bash
# Copyright (c) 2008 Wanderson S. Reis <wasare@gmail.com>
#
# Adaptado para gerar estatisticas do ping.
# Bruno Emer <emerbruno@gmail.com> 2016
#
# parametros :
#endereco IP e numero de sequencia do teste para controle
# ( opcional )
#
IP=$1

ping $1 > $2-stat-$1.log &
PINGPID=$!

INITMP=`date +%s`
RETORNO=0
while [ $RETORNO -eq 0 ]
do
	ping -c 1 $1 2> /dev/null 1> /dev/null
	RETORNO=$?

	TIMECUR=$(( `date +%s` - $INITMP ))
        if [ $TIMECUR -gt 90 ]; then
                break;
        fi
done
INICIAL=`date +%s`
while [ $RETORNO -ne 0 ]
do
	ping -c 1 $1 2> /dev/null 1> /dev/null
	RETORNO=$?
done
FINAL=`date +%s`
INTERVALO=$(( $FINAL - $INICIAL ))
echo "host $1 : $INTERVALO s" > $2-downtime-$1.log

while :; do
	TIMECUR=$(( `date +%s` - $INITMP ))
	if [ $TIMECUR -gt 150 ]; then
                break;
        fi
	sleep 1;
done

#pkill -SIGINT ping
kill -SIGINT $PINGPID

exit 0

