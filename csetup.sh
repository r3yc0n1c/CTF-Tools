#!/usr/bin/env bash
# ------------------------------------------------------------------
# [ Author ] 		REY / @r3yc0n1c (Twitter)
# [ Description ]	Crypto setup script
# [ Usage ]			chmod +x csetup.sh && ./csetup.sh
# ------------------------------------------------------------------

echo -e "\x1b[32m[+] Installing Dependencies... \x1b[0m"
echo
sudo apt install -y python3 python3-pip \
					libgmp-dev libmpfr-dev libmpc-dev \
					python3-gmpy2 
sudo pip3 install pycryptodome
echo
echo -e "\x1b[32m[+] Installation Successful !!! \x1b[0m"
