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

REP=$1
IP=$2
PORT1=$3
PORT2=$4
USER=$(whoami)

mkdir -p /home/$USER/resultado_iperf3
mkdir -p /home/$USER/resultado_iperf3/duplex
mkdir -p /home/$USER/resultado_iperf3/simplex
mkdir -p /home/$USER/resultado_iperf3/speedtest

#====================DUPLEX====================
./scripts/down.sh $IP $PORT1 $REP duplex down.txt &
./scripts/up.sh $IP $PORT2 $REP duplex up.txt &
./scripts/google.sh $REP duplex google.txt &
./scripts/router.sh $REP duplex router.txt &
./scripts/load.sh $REP '1/4'
#./scripts/load.sh 1/1 REP
#gnome-terminal -- ./scripts/down.sh $IP $PORT1 $REP duplex down.txt
#gnome-terminal -- ./scripts/up.sh $IP $PORT2 $REP duplex up.txt
#gnome-terminal -- ./scripts/google.sh $REP duplex google.txt
#gnome-terminal -- ./scripts/router.sh $REP duplex router.txt
#sleep $REP
#====================SIMPLEX====================
./scripts/down.sh $IP $PORT1 50 simplex down.txt &
./scripts/google.sh 50 simplex google_down.txt &
./scripts/router.sh 50 simplex router_down.txt &
./scripts/load.sh 50 '2/4'
#gnome-terminal -- ./scripts/down.sh $IP $PORT1 $REP simplex down.txt
#gnome-terminal -- ./scripts/google.sh $REP simplex google_down.txt
#gnome-terminal -- ./scripts/router.sh $REP simplex router_down.txt
#sleep 10
./scripts/up.sh $IP $PORT2 50 simplex up.txt &
./scripts/google.sh 50 simplex google_up.txt &
./scripts/router.sh 50 simplex router_up.txt &
./scripts/load.sh 50 '3/4'
#gnome-terminal -- ./scripts/up.sh $IP $PORT2 $REP simplex up.txt
#gnome-terminal -- ./scripts/google.sh $REP simplex google_up.txt
#gnome-terminal -- ./scripts/router.sh $REP simplex router_up.txt 
#sleep 10
#===================SPEEDTESTE===================
./scripts/speedtest.sh 15 speedtest speedtest.txt &
./scripts/load.sh 15 '4/4'
#gnome-terminal -- ./scripts/speedtest.sh $REP speedtest speedtest.txt
#===================RESULTADO====================
#sleep 15
./scripts/result.sh 
