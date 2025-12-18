#!/bin/bash

# ===============================================
# AUTO INSTALLER PANEL V2 - NEXA DEV
# ===============================================

BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]            AUTO INSTALLER PANEL V2             [+]${NC}"
echo -e "${BLUE}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e ""

# Minta input dari pengguna
read -p "Masukkan domain: " domain
read -p "Masukkan Email: " email
read -p "Masukkan Password Login: " password
read -p "Masukkan Subdomain Panel: " subdomain
read -p "Masukkan Domainnode: " domainnode

echo -e "${YELLOW}[*] Memulai instalasi panel...${NC}"

bash <(curl -s https://pterodactyl-installer.se) <<EOF
0
nexabot
nexa
nexadev
Nexa007
Asia/Jakarta
$email
$email
nexadev
adm
adm
$password
$subdomain
y
y
y
y
yes
A
EOF

echo -e ""
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]          INSTALASI PANEL V2 SELESAI            [+]${NC}"
echo -e "${GREEN}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
