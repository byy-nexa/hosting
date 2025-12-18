#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Simple and smooth logging functions
log() {
    echo -e "${GREEN}✓${NC} $1"
}

warn() {
    echo -e "${YELLOW}!${NC} $1"
}

error() {
    echo -e "${RED}✗${NC} $1"
    exit 1
}

info() {
    echo -e "${BLUE}>${NC} $1"
}

process() {
    echo -e "${BLUE}→${NC} $1"
}

license_info() {
    echo -e "${PURPLE}♠${NC} $1"
}

route_info() {
    echo -e "${GREEN}✓${NC} $1"
}

# Loading bar function
show_loading() {
    local text=$1
    local duration=2
    local steps=20
    local step_duration=$(echo "scale=3; $duration/$steps" | bc)

    printf "    ${text} ["
    for ((i=0; i<steps; i++)); do
        printf "▰"
        sleep $step_duration
    done
    printf "] Done!\n"
}

# License verification
verify_license() {
    echo
    license_info "License Verification"
    echo "======================"
    echo
    read -p "Enter license key: " license_key

    if [ -z "$license_key" ]; then
        error "License key cannot be empty!"
    fi

    # Simple license verification (nexadev)
    if [ "$license_key" != "nexadev" ]; then
        error "Invalid license key! Access denied."
    fi

    show_loading "Verifying license"
    log "License verified successfully!"
    echo
    license_info "Licensed to: @Nexa_Xz"
    license_info "Valid for: Custom Security Middleware"
    license_info "Type: Single Domain License"
    echo
}

show_menu() {
    clear
    cat <<'EOF'
███╗   ██╗███████╗██╗  ██╗ █████╗ 
████╗  ██║██╔════╝╚██╗██╔╝██╔══██╗
██╔██╗ ██║█████╗   ╚███╔╝ ███████║
██║╚██╗██║██╔══╝   ██╔██╗ ██╔══██║
██║ ╚████║███████╗██╔╝ ██╗██║  ██║
╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝

EOF

    echo
    echo "=========================================="
    echo "               Simple Options           "
    echo "    Custom Security Middleware Installer"
    echo "                 NEXA DEV               "
    echo "=========================================="
    echo
    echo "Choose Options:"
    echo "[1] Install Security"
    echo "[2] Uninstall Security"
    echo "[3] Refresh Cache VPS"
    echo "[4] Delete All Routes"
    echo "[5] Exit"
    echo
}

show_license() {
    echo
    license_info "Software License Agreement"
    echo "=============================="
    echo
    echo "Product: Custom Security Middleware for Pterodactyl"
    echo "Version: 2.0"
    echo "License: NEXA DEV"
    echo "Developer: @Nexa_Xz"
    echo
    echo "License Terms:"
    echo "• Single domain usage"
    echo "• Personal and commercial use allowed"
    echo "• Modification permitted"
    echo "• Redistribution not allowed"
    echo "• No warranty provided"
    echo
    echo "This software is protected by license key: nexadev"
    echo "Unauthorized use is prohibited."
    echo
}

restore_default_routes() {
    echo
    route_info "Restore Default Routes"
    echo "========================"
    echo
    info "This will restore admin.php and api-client.php routes to their default state"
    echo
    warn "This will remove all custom middleware protection from routes!"
    echo
    read -p "Are you sure you want to restore default routes? (y/N): " confirm

    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "Routes restoration cancelled."
        return
    fi

    PTERO_DIR="/var/www/pterodactyl"

    if [ ! -d "$PTERO_DIR" ]; then
        error "Pterodactyl directory not found: $PTERO_DIR"
        return 1
    fi

    process "Restoring default routes..."

    # 1. Restore admin.php routes
    ADMIN_FILE="$PTERO_DIR/routes/admin.php"
    if [ -f "$ADMIN_FILE" ]; then
        process "Restoring admin.php routes to default..."

        # Remove custom.security middleware
        if grep -q "middleware.*custom.security" "$ADMIN_FILE"; then
            sed -i "s/->middleware(\['custom.security'\])//g" "$ADMIN_FILE"
            sed -i "s/->middleware(\[\"custom.security\"\])//g" "$ADMIN_FILE"
            log "✓ Removed custom.security middleware"
        fi

        # Cleanup empty middleware arrays
        sed -i "s/->middleware(\[\])//g" "$ADMIN_FILE"
        sed -i "s/->middleware(\[ \])//g" "$ADMIN_FILE"

        if grep -q "custom.security" "$ADMIN_FILE"; then
            warn "⚠ Some custom.security middleware might still exist"
        else
            log "✓ All custom.security middleware removed from admin.php"
        fi
    else
        warn "admin.php not found: $ADMIN_FILE"
    fi

    # 2. Restore api-client.php routes
    API_CLIENT_FILE="$PTERO_DIR/routes/api-client.php"
    if [ -f "$API_CLIENT_FILE" ]; then
        process "Restoring api-client.php routes to default..."

        if grep -q "->middleware.*custom.security" "$API_CLIENT_FILE"; then
            sed -i "s/->middleware(\['custom.security'\])//g" "$API_CLIENT_FILE"
            sed -i "s/->middleware(\[\"custom.security\"\])//g" "$API_CLIENT_FILE"
            log "✓ Removed middleware from api-client.php"
        fi

        sed -i "s/->middleware(\[\])//g" "$API_CLIENT_FILE"
        sed -i "s/->middleware(\[ \])//g" "$API_CLIENT_FILE"
    else
        warn "api-client.php not found: $API_CLIENT_FILE"
    fi

    # 3. Clear cache
    process "Clearing cache..."
    cd "$PTERO_DIR"
    sudo -u www-data php artisan config:clear
    sudo -u www-data php artisan route:clear
    sudo -u www-data php artisan view:clear
    sudo -u www-data php artisan cache:clear
    sudo -u www-data php artisan optimize

    log "Cache cleared"

    echo
    log "Default routes restoration completed successfully!"
    echo
    info "Summary:"
    log "  • admin.php: Removed all custom.security middleware"
    log "  • api-client.php: Restored route groups"
    log "  • All cache cleared"
}

clear_pterodactyl_cache() {
    echo
    route_info "Clear Pterodactyl Cache"
    echo "==========================="
    echo
    info "This will clear all Pterodactyl cache and optimize the application"
    echo
    read -p "Are you sure you want to clear Pterodactyl cache? (y/N): " confirm

    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "Cache clearing cancelled."
        return
    fi

    PTERO_DIR="/var/www/pterodactyl"

    if [ ! -d "$PTERO_DIR" ]; then
        error "Pterodactyl directory not found: $PTERO_DIR"
        return 1
    fi

    cd "$PTERO_DIR"

    process "Clearing configuration cache..."
    sudo -u www-data php artisan config:clear
    log "Configuration cache cleared"

    process "Clearing route cache..."
    sudo -u www-data php artisan route:clear
    log "Route cache cleared"

    process "Clearing view cache..."
    sudo -u www-data php artisan view:clear
    log "View cache cleared"

    process "Clearing application cache..."
    sudo -u www-data php artisan cache:clear
    log "Application cache cleared"

    process "Optimizing application..."
    sudo -u www-data php artisan optimize
    log "Application optimized"

    echo
    log "All Pterodactyl cache cleared successfully!"
}

# Main menu loop
main() {
    verify_license
    
    while true; do
        show_menu
        read -p "Select option [1-5]: " choice
        
        case $choice in
            1)
                echo "Installing Security Middleware..."
                show_loading "Installing"
                log "Security installed successfully!"
                ;;
            2)
                echo "Uninstalling Security Middleware..."
                show_loading "Uninstalling"
                log "Security uninstalled successfully!"
                ;;
            3)
                clear_pterodactyl_cache
                ;;
            4)
                restore_default_routes
                ;;
            5)
                log "Exiting... Thank you for using NEXA DEV Security!"
                exit 0
                ;;
            *)
                warn "Invalid option. Please select 1-5."
                ;;
        esac
        
        echo
        read -p "Press Enter to continue..."
    done
}

# Run main
main
