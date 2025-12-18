#!/bin/bash

# ===============================================
# UNINSTALL PANEL - NEXA DEV
# ===============================================

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]              UNINSTALL PANEL                   [+]${NC}"
echo -e "${BLUE}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e ""

echo -e "${RED}[!] PERINGATAN: Ini akan menghapus panel Pterodactyl!${NC}"
read -p "Apakah Anda yakin? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo -e "${YELLOW}Uninstall dibatalkan.${NC}"
    exit 0
fi

# Uninstall panel
bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF

echo -e ""
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]          UNINSTALL PANEL SELESAI               [+]${NC}"
echo -e "${GREEN}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
