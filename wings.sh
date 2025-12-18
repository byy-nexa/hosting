#!/bin/bash

# ===============================================
# CONFIGURE WINGS - NEXA DEV
# ===============================================

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]              CONFIGURE WINGS                   [+]${NC}"
echo -e "${BLUE}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e ""

# Minta input token dari pengguna
read -p "Masukkan token untuk menjalankan wings: " token

# Menjalankan perintah dengan menggunakan token yang dimasukkan
echo "Menjalankan perintah dengan token: $token"
eval $token

# Menjalankan perintah systemctl start wings
sudo systemctl start wings

echo -e ""
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]           WINGS BERHASIL DIJALANKAN            [+]${NC}"
echo -e "${GREEN}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
