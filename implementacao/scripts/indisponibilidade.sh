#!/bin/sh
# Copyright (c) 2008 Wanderson S. Reis < wasare@gmail .com >
#
# parametros :
#endereco IP e numero de sequencia do teste para controle
# ( opcional )
#
IP=$1

ping $1 > $1-stat.log &
FOO_PID=$!

RETORNO=0
while [ $RETORNO -eq 0 ]
do
	ping -c 1 $1 2> /dev/null 1> /dev/null
	RETORNO=$?
done
INICIAL=`date +%s`
while [ $RETORNO -ne 0 ]
do
	ping -c 1 $1 2> /dev/null 1> /dev/null
	RETORNO=$?
done
FINAL=`date +%s`
INTERVALO=$(( $FINAL - $INICIAL ))
echo "host $1 : $INTERVALO s" > $1-downtime.log

#kill -SIGINT $FOO_PID
pkill -SIGINT ping

exit 0

