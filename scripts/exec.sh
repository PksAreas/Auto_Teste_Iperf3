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

REP=$1 #Tempo do teste em segundo que sera passado pelo script main
REP2=$[$REP/2] #Divide o tempo em 2 usado  para fazer os testes de down e up isolados 
IP=$2 #IP do servidor que sera passado pelo script main
PORT1=$3 #Porta do servidor que sera passado pelo script main (Download)
PORT2=$4 #Porta do servidor que sera passado pelo script main (Upload)
USER=$(whoami) #Usado para criar/ler/escrever na pasta correta do Usuario logado

#O bloco a seguir cria as pastas onde os testes são salvos caso não existão
mkdir -p /home/$USER/resultado_iperf3 
mkdir -p /home/$USER/resultado_iperf3/duplex
mkdir -p /home/$USER/resultado_iperf3/simplex
mkdir -p /home/$USER/resultado_iperf3/speedtest

#====================DUPLEX====================
./scripts/down.sh $IP $PORT1 $REP duplex down.txt & #Os 2 parametros passados no final são respectivamente nome da pasta e do arquivo
./scripts/up.sh $IP $PORT2 $REP duplex up.txt &
./scripts/google.sh $REP duplex google.txt &
./scripts/router.sh $REP duplex router.txt &
./scripts/load.sh $REP '1/4' 'DUPLEX'
#====================SIMPLEX====================
./scripts/down.sh $IP $PORT1 $REP2 simplex down.txt &
./scripts/google.sh $REP2 simplex google_down.txt &
./scripts/router.sh $REP2 simplex router_down.txt &
./scripts/load.sh $REP2 '2/4' 'DOWNLOAD SIMPLEX'
./scripts/up.sh $IP $PORT2 $REP2 simplex up.txt &
./scripts/google.sh $REP2 simplex google_up.txt &
./scripts/router.sh $REP2 simplex router_up.txt &
./scripts/load.sh $REP2 '3/4' 'UPLOAD SIMPLEX'
#===================SPEEDTESTE===================
./scripts/speedtest.sh speedtest speedtest.txt &
./scripts/load.sh 20 '4/4' 'SPEEDTEST'
#===================RESULTADO====================
./scripts/result.sh
