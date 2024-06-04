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

USER=$(whoami) #Usado para criar/ler/escrever na pasta correta do Usuario logado

iperf3 -c $1 -p $2 -P16 -t $3 >/home/$USER/resultado_iperf3/$4/$5
