#!/bin/bash

# ------------------------------------------------------------------
# Copyright (c) 2016-09-02 Bruno Emer <emerbruno@gmail.com>
#
# Verifica e faz reinicializacao de um node do cluster pacemaker / drbd
# Instalacao:
# Agendar no cron de cada node em dias diferentes
#
# ------------------------------------------------------------------

PROGNAME=`/usr/bin/basename $0`
NODE=`hostname`
ONLINE_CHECK_RES="OCFS_MOUNT_CLONE"
STANDBY_CHECK_RES="MS_DRBD"

logger "Script manutencao cluster $PROGNAME node: $NODE"

#verificacoes
#se cluster esta ok
NAG_CHECK=$(/usr/lib/nagios/plugins/check_crm_v0_7)
NAG=$?
logger "Cluster nagios check: $NAG_CHECK"
if [ $NAG -ne 0 ]; then
	logger "Erro. Cluster nao esta ok"
	exit
fi

#se ja reiniciou nao executa
UPTIME=`awk '{print $1}' /proc/uptime`
UPINT=${UPTIME%.*}
if [ $UPINT -lt 86400 ]; then
	logger "Ja reiniciado"
	exit
fi

# ------------------------------------------------------------------
#recovery - retorna node para online se ja foi reiniciado
if [ -f pacemaker_reboot.tmp ]; then
	#verifica se pacemaker esta iniciado
	service pacemaker status
	PACEMAKER_ST=$?
	if [ $PACEMAKER_ST -eq 0 ]; then
		logger "Online $NODE"
		/usr/sbin/crm node online $NODE
		rm pacemaker_reboot.tmp
	else
		service pacemaker start
	fi
else
# ------------------------------------------------------------------
#destroy - derruba node para reiniciar
	#se outro node esta online
	RES_CHECK=$(/usr/sbin/crm resource show $ONLINE_CHECK_RES)
	NODE_LIST=$(/usr/sbin/crm_node -l |awk '{print $2}' |grep -v $NODE)
	NODES_N=$(/usr/sbin/crm_node -l |awk '{print $2}' |grep -v $NODE |wc -l)
	NODES_ON=0
	for row in $NODE_LIST; do
		RES_ON=$(echo "$RES_CHECK" |grep "$row")
		if [ -n "$RES_ON" ]; then
			logger "$row online"
			((NODES_ON++))
		fi
	done
	if [ $NODES_ON -lt $NODES_N ]; then
		logger "Erro. Algum node nao esta online"
		exit
	fi

	#desativa servicos do node
	logger "Standby $NODE"
	/usr/sbin/crm node standby "$NODE"

	#aguarda node ficar livre, vms down e drbd down
	while :; do
		RES_CHECK_DRBD=$(/usr/sbin/crm resource show $STANDBY_CHECK_RES)
		RES_DRBD_ON=$(echo "$RES_CHECK_DRBD" |grep "$NODE")
		VMS_NUM=$(virsh list --name |wc -l)
	        if [ -z "$RES_DRBD_ON" ] && [ $VMS_NUM -le 1 ]; then
			logger "Pronto para reiniciar"
			break
		else
			logger "Servicos ainda executando"
		fi
		sleep 30
	done

	#escreve arquivo para recuperar node depois do reboot
	echo $(date +"%Y-%m-%d") > pacemaker_reboot.tmp

	#reinicia node
	logger "Rebooting..."
	/sbin/reboot

fi

