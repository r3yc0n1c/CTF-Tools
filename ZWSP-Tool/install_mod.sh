#!/bin/bash

echo -e "------------------------------"
echo -e "[+] Installing dependencies..."
echo -e "------------------------------\n"
apt-get update

echo -e "\n---------------------"
echo -e "[+] Installing git..."
echo -e "---------------------\n"
apt-get -y install git

echo -e "\n-------------------------"
echo -e "[+] Installing python3..."
echo -e "-------------------------\n"
apt-get -y install python3

echo -e "\n-----------------------------"
echo -e "[+] Installing python3-pip..."
echo -e "-----------------------------\n"
apt-get -y install python3-pip

echo -e "\n--------------------------------------"
echo -e "[+] Installing python3 dependencies..."
echo -e "--------------------------------------\n"

python3 -m pip install pycryptodome
python3 -m pip install alive-progress
python3 -m pip install tabulate

echo -e "\n-----------------------------"
echo -e "\n[+] Successfully installed !"