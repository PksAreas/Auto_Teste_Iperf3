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
GAT=$(netstat -nr|grep -n ^ | grep "3:" | cut -b 19-34|sed -e "s/ //") #Variavel que coleta o ip de Gatway da estação

ping $GAT -c $1 >/home/$USER/resultado_iperf3/$2/$3
