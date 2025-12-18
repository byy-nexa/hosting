#!/bin/bash

# ===============================================
# REPAIR PANEL / UNINSTALL THEME - NEXA DEV
# ===============================================

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if (( $EUID != 0 )); then
    echo -e "${RED}Silahkan masuk ke direktori root${NC}"
    exit
fi

echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]           REPAIR PANEL / DELETE THEME          [+]${NC}"
echo -e "${BLUE}[+]                  © NEXA DEV                    [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e ""

repairPanel(){
    cd /var/www/pterodactyl

    php artisan down

    rm -r /var/www/pterodactyl/resources

    curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv

    chmod -R 755 storage/* bootstrap/cache

    composer install --no-dev --optimize-autoloader

    php artisan view:clear

    php artisan config:clear

    php artisan migrate --seed --force

    chown -R www-data:www-data /var/www/pterodactyl/*

    php artisan queue:restart

    php artisan up

    echo -e ""
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              REPAIR PANEL SELESAI              [+]${NC}"
    echo -e "${GREEN}[+]                  © NEXA DEV                    [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
}

while true; do
    read -p "Apakah kamu yakin untuk mengUninstall theme? [y/n] " yn
    case $yn in
        [Yy]* ) repairPanel; break;;
        [Nn]* ) exit;;
        * ) echo "Silahkan pilih (y/yes) (n/no).";;
    esac
done
exit
