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

USER=$(whoami)

iperf3 -c $1 -p $2 -P16 -R -t $3 >/home/$USER/resultado_iperf3/$4/$5
