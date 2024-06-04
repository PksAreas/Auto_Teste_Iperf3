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

REP=100
IP=127.0.0.1
PORT1=5000
PORT2=5001

gnome-terminal -- ./scripts/exec.sh $REP $IP $PORT1 $PORT2
