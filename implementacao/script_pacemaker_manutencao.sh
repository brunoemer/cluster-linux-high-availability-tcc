#!/bin/bash

# ------------------------------------------------------------------
# [Bruno Emer] 2016-09-02
#
# Verifica e faz reinicializacao de um node do cluster pacemaker / drbd
#
# ------------------------------------------------------------------

PROGNAME=`/usr/bin/basename $0`
NODE=`hostname`

logger "Script manutencao cluster $PROGNAME node: $NODE"

#destroy - derruba node para reiniciar

#verificacoes
#se cluster esta ok
NAG_CHECK=$(/usr/lib/nagios/plugins/check_crm_v0_7)
NAG=$?
logger "Cluster nagios check: $NAG_CHECK"
if [ $NAG -ne 0 ]; then
	logger "Erro. Cluster nao esta ok"
	exit
fi

#se outro node esta online
RES_CHECK=$(crm resource show OCFS_MOUNT_CLONE)
NODE_LIST=$(crm_node -l |awk '{print $2}' |grep -v $NODE)
NODES_N=$(crm_node -l |awk '{print $2}' |grep -v $NODE |wc -l)
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
##crm node standby $NODE

#aguarda no ficar livre, vms down e drbd down


#reinicia node
logger "Rebooting..."
##reboot


# ------------------------------------------------------------------
#recovery - retorna node para online

#como retornar do standby?? escrever em arquivo, executar mais de uma vez

##crm node online $NODE

