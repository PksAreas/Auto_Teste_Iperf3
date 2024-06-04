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
GAT=$(netstat -nr|grep -n ^ | grep "3:" | cut -b 19-34|sed -e "s/ //")

ping $GAT -c $1 >/home/$USER/resultado_iperf3/$2/$3
