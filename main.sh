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
#================================9

REP=3600 #Tempo de cada teste em segundos
IP=127.0.0.1 #IP do servidor iperf3
PORT1=5000 #Porta utilizada pelo iperf3 (Download)
PORT2=5001 #Porta utilizada pelo iperf3 (Upload)

./scripts/exec.sh $REP $IP $PORT1 $PORT2
