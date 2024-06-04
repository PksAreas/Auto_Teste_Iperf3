#!/bin/bash

#================================
#AUTOR: PATRICK AREAS          ||
#COAUTOR: GUILHERME GUIMARÃES  ||
#DATA: 31/05/2024              ||
#VERSION: 1.3                  ||
#Obs: Script criado na intenção||
#    de agilizar os testes ho- ||
#    mologatorios de novos     ||
#    equipamentos.             ||
#================================

#SCRIPT USADO PARA CRIAR A BARRA DE LOAD DO PROGRAMA PRINCIPAL

CONT1=0
CONT2=0
CONT3=0
REP=$1
REP2=$[$REP/100]

if [ $REP -le 99 ];then
	let REP2=$[$REP/10]
fi

echo "TESTE $2 EM EXECUÇÃO"
while [ $CONT1 -lt $REP ]; do #Numero de repetições do teste ex: 3600
        let CONT1=CONT1+1;
        let CONT2=CONT2+1;

        if [ $CONT2 -ge $REP2 ];then #Incremeta a barrinha de load
        	if [ $REP -le 99 ];then
 	       		clear
               		CONT2=0
               		let CONT3=CONT3+10
               		echo "TESTE $2 EM EXECUÇÃO"
               		echo "$CONT3% `seq -s '█' $CONT3 | tr -d [:digit:]`"
        	else
               		clear
               		CONT2=0
               		let CONT3=CONT3+1
               		echo "TESTE $2 EM EXECUÇÃO"
               		echo "$CONT3% `seq -s '█' $CONT3 | tr -d [:digit:]`"
        	fi
        fi
       sleep 1
done
