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

ping 8.8.8.8 -c $1 >/home/$USER/resultado_iperf3/$2/$3
