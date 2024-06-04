#!/bin/bash

#================================
#AUTOR: PATRICK AREAS          ||
#COAUTOR: GUILHERME GUIMARÃES  ||
#DATA: 04/06/2024              ||
#VERSION: 2.0                  ||
#Obs: Script criado na intenção||
#    de agilizar os testes ho- ||
#    mologatorios de novos     ||
#    equipamentos.             ||
#================================

#SCRIPT USADO PARA CRIAR A BARRA DE LOAD DO PROGRAMA PRINCIPAL

CONT1=0
CONT2=0
CONT3=0
REP=$1 #Numero de repetições do teste em segundos ex: 3600
REP2=$[$REP/100] #Usado pra calcular o valor de 1% e fazer a barra "andar"
INCMT=$[100/$REP] #Usado pra encrementar a barra de load

echo "TESTE $2 EM EXECUÇÃO ($3)"
while [ $CONT1 -lt $REP ]; do 
        let CONT1=CONT1+1;
        let CONT2=CONT2+1;

        if [ $CONT2 -ge $REP2 ];then #Incremeta a barrinha de load
        	if [ $REP -le 99 ];then
 	       		clear
               		let CONT3=CONT3+INCMT
					CONT2=0
					echo "TESTE $2 EM EXECUÇÃO ($3)"
               		echo "$CONT3% `seq -s '█' $CONT3 | tr -d [:digit:]`"
        	else
               		clear
               		CONT2=0
               		let CONT3=CONT3+1
               		echo "TESTE $2 EM EXECUÇÃO ($3)"
               		echo "$CONT3% `seq -s '█' $CONT3 | tr -d [:digit:]`"
        	fi
        fi
       sleep 1
done
