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

#O bloco a seguir Armazena os testes que estão em txt em variaves
ARQUIVO1=$(cat /home/$USER/resultado_iperf3/duplex/down.txt | grep SUM | tail -2) 
ARQUIVO2=$(cat /home/$USER/resultado_iperf3/duplex/up.txt | grep SUM | tail -2)
ARQUIVO3=$(cat /home/$USER/resultado_iperf3/duplex/google.txt | tail -3)
ARQUIVO4=$(cat /home/$USER/resultado_iperf3/duplex/router.txt | tail -3)

ARQUIVO5=$(cat /home/$USER/resultado_iperf3/simplex/down.txt | grep SUM | tail -2)
ARQUIVO6=$(cat /home/$USER/resultado_iperf3/simplex/google_down.txt | tail -3)
ARQUIVO7=$(cat /home/$USER/resultado_iperf3/simplex/router_down.txt | tail -3)

ARQUIVO8=$(cat /home/$USER/resultado_iperf3/simplex/up.txt | grep SUM | tail -2)
ARQUIVO9=$(cat /home/$USER/resultado_iperf3/simplex/google_up.txt | tail -3)
ARQUIVO10=$(cat /home/$USER/resultado_iperf3/simplex/router_up.txt | tail -3)

ARQUIVO11=$(cat /home/$USER/resultado_iperf3/speedtest/speedtest.txt)

clear
echo "===================================================================================================="
echo "||                                      TESTES CONCLUIDOS                                         ||"
echo "===================================================================================================="
echo ""
sleep 1
echo "==============================================DUPLEX================================================"
echo "--- Download statistics ---"
echo "$ARQUIVO1"
echo "--- Upload statistics ---"
echo "$ARQUIVO2"
echo ""
echo "$ARQUIVO3"
echo ""
echo "$ARQUIVO4"
echo ""
sleep 1 
echo "=============================================SIMPLEX================================================"
echo "--- Download statistics ---"
echo "$ARQUIVO5"
echo ""
echo "$ARQUIVO6"
echo ""
echo "$ARQUIVO7"
echo ""
sleep 1
echo "=============================================SIMPLEX================================================"
echo "--- Upload statistics ---"
echo "$ARQUIVO8"
echo ""
echo "$ARQUIVO9"
echo ""
echo "$ARQUIVO10"
echo ""
sleep 1
echo "========================================SPEEDTEST BY OOKLA=========================================="
echo "$ARQUIVO11"

read #Usado para não fechar o terminal, caso o teste esteja sendo realizado em um SO com GUI
