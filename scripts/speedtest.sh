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

speedtest -s 00001 >/home/$USER/resultado_iperf3/$1/$2
