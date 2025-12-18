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
    
    # Simple license verification (NEXA GANTENG)
    if [ "$license_key" != "NEXA GANTENG" ]; then
        error "Invalid license key! Access denied."
    fi
    
    show_loading "Verifying license"
    log "License verified successfully!"
    echo
    license_info "Licensed to: @NEXABOT"
    license_info "Valid for: Custom Security Middleware"
    license_info "Type: Single Domain License"
    echo
}

show_menu() {
    clear
    cat <<'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠒⠒⠉⣩⣽⣿⣿⣿⣿⣿⠿⢿⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⣿⣿⡷⠀⠈⠙⠻⢿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣴⣶⣿⣿⣿⣿⣦⣄⣾⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⠏⠉⢹⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣁⡀⠀⢸⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⠀⢸⣿⣿⡇⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣷⣼⣿⣿⡇⠀⠈⠻⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⡃⠙⣿⣿⣄⡀⠀⠈⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠘⣿⣿⣿⣷⣶⣤⣈⡟⢳⢄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢻⣿⣯⡉⠛⠻⢿⣿⣷⣧⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡿⠹⣿⣿⣿⣷⠀⠀⠀⢀⣿⣿⣷⣄⠀⠀⠈⠙⠿⣿⣄⠀⠀⠀⢠⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⠋⠀⣀⣻⣿⣿⣿⣀⣠⣶⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠈⢹⠇⠀⠀⣾⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣟⠛⠋⠉⠁⠀⠀⠀⠉⠻⢧⠀⠀⠀⠘⠃⠀⣼⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⡀⠀⠀⠀⠀⢿⣿⣿⠿⠟⠛⠉⠁⠈⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⢺⠀⠀⠀⠀⢀⣾⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠊⠀⠀⠀⣰⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣶⣦⣤⣤⣀⣀⣀⣻⣿⣀⣀⣤⣴⣶⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢿⣿⣯⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

    echo
    echo "=========================================="
    echo "               Simple Options           "
    echo "    Custom Security Middleware Installer"
    echo "                 @NEXABOT               "
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
    echo "License: NEXA GANTENG"
    echo "Developer: @NEXABOT"
    echo
    echo "License Terms:"
    echo "• Single domain usage"
    echo "• Personal and commercial use allowed"
    echo "• Modification permitted"
    echo "• Redistribution not allowed"
    echo "• No warranty provided"
    echo
    echo "This software is protected by license key: NEXA GANTENG"
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
        
        # Method 1: Remove custom.security middleware with various patterns
        restored_count=0
        
        # Pattern 1: Standard middleware pattern
        if grep -q "middleware.*custom.security" "$ADMIN_FILE"; then
            sed -i "s/->middleware(\['custom.security'\])//g" "$ADMIN_FILE"
            log "✓ Removed standard custom.security middleware"
            ((restored_count++))
        fi
        
        # Pattern 2: Middleware with different quotes
        if grep -q "middleware.*custom.security" "$ADMIN_FILE"; then
            sed -i "s/->middleware(\[\"custom.security\"\])//g" "$ADMIN_FILE"
            sed -i "s/->middleware(\['custom.security'\])//g" "$ADMIN_FILE"
            log "✓ Removed custom.security middleware with different quotes"
            ((restored_count++))
        fi
        
        # Pattern 3: Middleware with spaces
        if grep -q "middleware.*custom.security" "$ADMIN_FILE"; then
            sed -i "s/->middleware( \[ 'custom.security' \] )//g" "$ADMIN_FILE"
            sed -i "s/->middleware( \['custom.security'\] )//g" "$ADMIN_FILE"
            log "✓ Removed custom.security middleware with spaces"
            ((restored_count++))
        fi
        
        # Pattern 4: Multiple middleware arrays
        if grep -q "middleware.*custom.security" "$ADMIN_FILE"; then
            # Remove from single middleware array
            sed -i "s/->middleware(\['custom.security'\])//g" "$ADMIN_FILE"
            # Remove from multiple middleware array
            sed -i "s/, 'custom.security'//g" "$ADMIN_FILE"
            sed -i "s/'custom.security', //g" "$ADMIN_FILE"
            log "✓ Removed custom.security from multiple middleware arrays"
            ((restored_count++))
        fi
        
        # Final cleanup: Remove empty middleware arrays
        sed -i "s/->middleware(\[\])//g" "$ADMIN_FILE"
        sed -i "s/->middleware(\[ \])//g" "$ADMIN_FILE"
        
        # Verify restoration
        if grep -q "custom.security" "$ADMIN_FILE"; then
            warn "⚠ Some custom.security middleware might still exist"
            process "Manual cleanup might be required"
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
        
        # Remove custom.security from /files route group with various patterns
        api_restored=0
        
        # Pattern 1: Standard group pattern
        if grep -q "prefix.*files.*middleware.*custom.security" "$API_CLIENT_FILE"; then
            sed -i "s|Route::group(\['prefix' => '/files', 'middleware' => \['custom.security'\]|Route::group(['prefix' => '/files'|g" "$API_CLIENT_FILE"
            sed -i "s|Route::group(['prefix' => '/files', 'middleware' => ['custom.security']|Route::group(['prefix' => '/files'|g" "$API_CLIENT_FILE"
            log "✓ Restored /files route group to default"
            ((api_restored++))
        fi
        
        # Pattern 2: Remove individual middleware from routes
        if grep -q "->middleware.*custom.security" "$API_CLIENT_FILE"; then
            sed -i "s/->middleware(\['custom.security'\])//g" "$API_CLIENT_FILE"
            sed -i "s/->middleware(\[\"custom.security\"\])//g" "$API_CLIENT_FILE"
            log "✓ Removed individual middleware from api-client.php"
            ((api_restored++))
        fi
        
        # Cleanup empty middleware arrays
        sed -i "s/->middleware(\[\])//g" "$API_CLIENT_FILE"
        sed -i "s/->middleware(\[ \])//g" "$API_CLIENT_FILE"
        
        if [ "$api_restored" -eq 0 ]; then
            warn "No custom middleware found in api-client.php"
        else
            log "✓ api-client.php routes restored"
        fi
        
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
    log "  • admin.php: Removed all custom.security middleware patterns"
    log "  • api-client.php: Restored route groups and removed middleware"
    log "  • All cache cleared"
    echo
    warn "Note: If routes still have issues, manual verification may be needed"
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
    
    process "Clearing Pterodactyl cache..."
    
    # Clear cache commands
    cd "$PTERO_DIR"
    
    process "Clearing config cache..."
    sudo -u www-data php artisan config:clear
    
    process "Clearing route cache..."
    sudo -u www-data php artisan route:clear
    
    process "Clearing view cache..."
    sudo -u www-data php artisan view:clear
    
    process "Clearing application cache..."
    sudo -u www-data php artisan cache:clear
    
    process "Optimizing application..."
    sudo -u www-data php artisan optimize
    
    log "✓ All cache cleared successfully!"
    echo
    log "Cache clearing completed!"
}

clear_security() {
    echo
    info "Clear Security Middleware"
    echo "========================="
    echo
    warn "Warning: This will remove security middleware and restore system to normal!"
    read -p "Are you sure you want to remove security middleware? (y/N): " confirm
    
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "Removal cancelled."
        return
    fi
    
    PTERO_DIR="/var/www/pterodactyl"
    
    if [ ! -d "$PTERO_DIR" ]; then
        error "Pterodactyl directory not found: $PTERO_DIR"
    fi
    
    process "Cleaning up security middleware..."
    
    # 1. Remove middleware file
    if [ -f "$PTERO_DIR/app/Http/Middleware/CustomSecurityCheck.php" ]; then
        rm -f "$PTERO_DIR/app/Http/Middleware/CustomSecurityCheck.php"
        log "Middleware file removed"
    else
        warn "Middleware file not found"
    fi
    
    # 2. Remove from Kernel.php
    KERNEL_FILE="$PTERO_DIR/app/Http/Kernel.php"
    if [ -f "$KERNEL_FILE" ]; then
        if grep -q "custom.security" "$KERNEL_FILE"; then
            sed -i "/'custom.security' => \\\\Pterodactyl\\\\Http\\\\Middleware\\\\CustomSecurityCheck::class,/d" "$KERNEL_FILE"
            log "Middleware removed from Kernel"
        else
            warn "Middleware not registered in Kernel"
        fi
    fi
    
    # 3. Remove middleware from routes
    process "Cleaning routes..."
    
    # api-client.php
    API_CLIENT_FILE="$PTERO_DIR/routes/api-client.php"
    if [ -f "$API_CLIENT_FILE" ]; then
        if grep -q "Route::group(\['prefix' => '/files', 'middleware' => \['custom.security'\]" "$API_CLIENT_FILE"; then
            sed -i "s/Route::group(\['prefix' => '\/files', 'middleware' => \['custom.security'\]/Route::group(['prefix' => '\/files'/g" "$API_CLIENT_FILE"
            log "Middleware removed from api-client.php"
        fi
    fi
    
    # admin.php - remove middleware from all route groups
    ADMIN_FILE="$PTERO_DIR/routes/admin.php"
    if [ -f "$ADMIN_FILE" ]; then
        # Pattern 1: Remove from Route::group yang memiliki middleware array
        sed -i "s/, 'middleware' => \['custom.security'\]//g" "$ADMIN_FILE"
        
        # Pattern 2: Remove dari Route::group yang hanya memiliki middleware custom.security saja
        sed -i "s/'middleware' => \['custom.security'\], //g" "$ADMIN_FILE"
        sed -i "s/'middleware' => \['custom.security'\]//g" "$ADMIN_FILE"
        
        # Pattern 3: Remove dari individual routes
        sed -i "s/->middleware(\['custom.security'\])//g" "$ADMIN_FILE"
        
        # Pattern 4: Clean up empty middleware arrays jika ada
        sed -i "s/'middleware' => \[\],//g" "$ADMIN_FILE"
        sed -i "s/, 'middleware' => \[\]//g" "$ADMIN_FILE"
        
        log "Middleware removed from admin.php"
    fi
    
    # 4. Clear cache
    process "Clearing cache..."
    cd $PTERO_DIR
    sudo -u www-data php artisan config:clear
    sudo -u www-data php artisan route:clear
    sudo -u www-data php artisan view:clear
    sudo -u www-data php artisan cache:clear
    sudo -u www-data php artisan optimize
    
    log "Cache cleared"
    
    # 5. Restart services
    process "Restarting services..."
    
    PHP_SERVICE=""
    if systemctl is-active --quiet php8.2-fpm; then
        PHP_SERVICE="php8.2-fpm"
    elif systemctl is-active --quiet php8.1-fpm; then
        PHP_SERVICE="php8.1-fpm"
    elif systemctl is-active --quiet php8.0-fpm; then
        PHP_SERVICE="php8.0-fpm"
    elif systemctl is-active --quiet php8.3-fpm; then
        PHP_SERVICE="php8.3-fpm"
    fi
    
    if [ -n "$PHP_SERVICE" ]; then
        systemctl restart $PHP_SERVICE
        log "$PHP_SERVICE restarted"
    fi
    
    if systemctl is-active --quiet pteroq; then
        systemctl restart pteroq
        log "pteroq service restarted"
    fi
    
    if systemctl is-active --quiet nginx; then
        systemctl reload nginx
        log "nginx reloaded"
    fi
    
    echo
    log "Security middleware successfully removed!"
    echo
    warn "System is now in NORMAL mode without security middleware protection"
}

add_custom_security_middleware() {
    echo
    route_info "Add Custom Security Middleware"
    echo "=================================="
    echo
    info "This will add 'custom.security' middleware to specific routes in admin.php and api-client.php"
    echo
    read -p "Are you sure you want to add custom security middleware? (y/N): " confirm
    
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "Custom security middleware addition cancelled."
        return
    fi
    
    PTERO_DIR="/var/www/pterodactyl"
    
    if [ ! -d "$PTERO_DIR" ]; then
        error "Pterodactyl directory not found: $PTERO_DIR"
        return 1
    fi
    
    ADMIN_FILE="$PTERO_DIR/routes/admin.php"
    API_CLIENT_FILE="$PTERO_DIR/routes/api-client.php"
    
    if [ ! -f "$ADMIN_FILE" ]; then
        error "admin.php not found: $ADMIN_FILE"
        return 1
    fi
    
    if [ ! -f "$API_CLIENT_FILE" ]; then
        error "api-client.php not found: $API_CLIENT_FILE"
        return 1
    fi
    
    process "Adding custom security middleware to routes..."
    
    # Backup the files
    admin_backup="$ADMIN_FILE.backup.$(date +%Y%m%d_%H%M%S)"
    api_backup="$API_CLIENT_FILE.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$ADMIN_FILE" "$admin_backup"
    cp "$API_CLIENT_FILE" "$api_backup"
    log "Backup created: $admin_backup"
    log "Backup created: $api_backup"
    
    # Counter for modified routes
    modified_count=0
    
    # 1. Admin.php routes
    process "Processing admin.php routes..."
    
    # 1.1 Settings group in admin.php
    if grep -q "Route::group(\['prefix' => 'settings'\], function () {" "$ADMIN_FILE"; then
        sed -i "s|Route::group(['prefix' => 'settings'], function () {|Route::group(['prefix' => 'settings', 'middleware' => ['custom.security']], function () {|g" "$ADMIN_FILE"
        log "✓ Added middleware to settings route group"
        modified_count=$((modified_count + 1))
    else
        warn "Settings route group not found or already modified"
    fi
    
    # 1.2 Users section - Route::patch and Route::delete
    process "Processing users routes..."
    
    # Route::patch for users
    if grep -q "Route::patch('/view/{user:id}', \[Admin\\UserController::class, 'update'\]);" "$ADMIN_FILE"; then
        sed -i "s|Route::patch('/view/{user:id}', \[Admin\\UserController::class, 'update'\]);|Route::patch('/view/{user:id}', \[Admin\\UserController::class, 'update'\])->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to Route::patch for users"
        modified_count=$((modified_count + 1))
    else
        warn "Route::patch for users not found or already modified"
    fi
    
    # Route::delete for users
    if grep -q "Route::delete('/view/{user:id}', \[Admin\\UserController::class, 'delete'\]);" "$ADMIN_FILE"; then
        sed -i "s|Route::delete('/view/{user:id}', \[Admin\\UserController::class, 'delete'\]);|Route::delete('/view/{user:id}', \[Admin\\UserController::class, 'delete'\])->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to Route::delete for users"
        modified_count=$((modified_count + 1))
    else
        warn "Route::delete for users not found or already modified"
    fi
    
    # 1.3 Servers section - ServerInstalled group
    process "Processing servers routes..."
    
    # Route::get for server details
    if grep -q "Route::get('/view/{server:id}/details', \[Admin\\Servers\\ServerViewController::class, 'details'\])->name('admin.servers.view.details');" "$ADMIN_FILE"; then
        sed -i "s|Route::get('/view/{server:id}/details', \[Admin\\Servers\\ServerViewController::class, 'details'\])->name('admin.servers.view.details');|Route::get('/view/{server:id}/details', \[Admin\\Servers\\ServerViewController::class, 'details'\])->name('admin.servers.view.details')->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to server details route"
        modified_count=$((modified_count + 1))
    else
        warn "Server details route not found or already modified"
    fi
    
    # Route::get for server delete
    if grep -q "Route::get('/view/{server:id}/delete', \[Admin\\Servers\\ServerViewController::class, 'delete'\])->name('admin.servers.view.delete');" "$ADMIN_FILE"; then
        sed -i "s|Route::get('/view/{server:id}/delete', \[Admin\\Servers\\ServerViewController::class, 'delete'\])->name('admin.servers.view.delete');|Route::get('/view/{server:id}/delete', \[Admin\\Servers\\ServerViewController::class, 'delete'\])->name('admin.servers.view.delete')->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to server delete route"
        modified_count=$((modified_count + 1))
    else
        warn "Server delete route not found or already modified"
    fi

    # Route::post for server delete
    if grep -q "Route::post('/view/{server:id}/delete', \[Admin\\ServersController::class, 'delete'\]);" "$ADMIN_FILE"; then
        sed -i "s|Route::post('/view/{server:id}/delete', \[Admin\\ServersController::class, 'delete'\]);|Route::post('/view/{server:id}/delete', \[Admin\\ServersController::class, 'delete'\])->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to server delete route"
        modified_count=$((modified_count + 1))
    else
        warn "Server delete route not found or already modified"
    fi
    
    # Route::patch for server details update
    if grep -q "Route::patch('/view/{server:id}/details', \[Admin\\ServersController::class, 'setDetails'\]);" "$ADMIN_FILE"; then
        sed -i "s|Route::patch('/view/{server:id}/details', \[Admin\\ServersController::class, 'setDetails'\]);|Route::patch('/view/{server:id}/details', \[Admin\\ServersController::class, 'setDetails'\])->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to server details update route"
        modified_count=$((modified_count + 1))
    else
        warn "Server details update route not found or already modified"
    fi
    
    # Route::delete for database delete
    if grep -q "Route::delete('/view/{server:id}/database/{database:id}/delete', \[Admin\\ServersController::class, 'deleteDatabase'\])->name('admin.servers.view.database.delete');" "$ADMIN_FILE"; then
        sed -i "s|Route::delete('/view/{server:id}/database/{database:id}/delete', \[Admin\\ServersController::class, 'deleteDatabase'\])->name('admin.servers.view.database.delete');|Route::delete('/view/{server:id}/database/{database:id}/delete', \[Admin\\ServersController::class, 'deleteDatabase'\])->name('admin.servers.view.database.delete')->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to database delete route"
        modified_count=$((modified_count + 1))
    else
        warn "Database delete route not found or already modified"
    fi
    
    # 1.4 Nodes section
    process "Processing nodes routes..."
    
    # Route::post for node settings token
    if grep -q "Route::post('/view/{node:id}/settings/token', Admin\\NodeAutoDeployController::class)->name('admin.nodes.view.configuration.token');" "$ADMIN_FILE"; then
        sed -i "s|Route::post('/view/{node:id}/settings/token', Admin\\NodeAutoDeployController::class)->name('admin.nodes.view.configuration.token');|Route::post('/view/{node:id}/settings/token', Admin\\NodeAutoDeployController::class)->name('admin.nodes.view.configuration.token')->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to node settings token route"
        modified_count=$((modified_count + 1))
    else
        warn "Node settings token route not found or already modified"
    fi
    
    # Route::patch for node settings
    if grep -q "Route::patch('/view/{node:id}/settings', \[Admin\\NodesController::class, 'updateSettings'\]);" "$ADMIN_FILE"; then
        sed -i "s|Route::patch('/view/{node:id}/settings', \[Admin\\NodesController::class, 'updateSettings'\]);|Route::patch('/view/{node:id}/settings', \[Admin\\NodesController::class, 'updateSettings'\])->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to node settings update route"
        modified_count=$((modified_count + 1))
    else
        warn "Node settings update route not found or already modified"
    fi
    
    # Route::delete for node delete
    if grep -q "Route::delete('/view/{node:id}/delete', \[Admin\\NodesController::class, 'delete'\])->name('admin.nodes.view.delete');" "$ADMIN_FILE"; then
        sed -i "s|Route::delete('/view/{node:id}/delete', \[Admin\\NodesController::class, 'delete'\])->name('admin.nodes.view.delete');|Route::delete('/view/{node:id}/delete', \[Admin\\NodesController::class, 'delete'\])->name('admin.nodes.view.delete')->middleware(['custom.security']);|g" "$ADMIN_FILE"
        log "✓ Added middleware to node delete route"
        modified_count=$((modified_count + 1))
    else
        warn "Node delete route not found or already modified"
    fi
    
    # 2. Api-client.php routes
    process "Processing api-client.php routes..."
    
    # 2.1 Server group middleware in api-client.php
    if grep -q "Route::group(\[" "$API_CLIENT_FILE" && grep -q "'prefix' => '/servers/{server}'" "$API_CLIENT_FILE" && grep -q "ServerSubject::class" "$API_CLIENT_FILE"; then
        # Find the line with middleware array and add custom.security
        sed -i "/'middleware' => \[/,/\]/{
            /ResourceBelongsToServer::class,/a\        'custom.security',
        }" "$API_CLIENT_FILE"
        log "✓ Added custom.security to server group middleware"
        modified_count=$((modified_count + 1))
    else
        warn "Server group route not found or already modified"
    fi
    
    # 2.2 Files group in api-client.php
    if grep -q "Route::group(\['prefix' => '/files'\], function () {" "$API_CLIENT_FILE"; then
        sed -i "s|Route::group(['prefix' => '/files'], function () {|Route::group(['prefix' => '/files', 'middleware' => ['custom.security']], function () {|g" "$API_CLIENT_FILE"
        log "✓ Added middleware to files route group"
        modified_count=$((modified_count + 1))
    else
        warn "Files route group not found or already modified"
    fi
    
    # 3. Alternative method for routes that might have different formatting
    process "Checking for alternative route formats..."
    
    # Alternative patterns for the same routes
    alternative_patterns=(
        "Route::patch.*view/{user:id}.*Admin.*UserController.*update.*);"
        "Route::delete.*view/{user:id}.*Admin.*UserController.*delete.*);"
        "Route::get.*view/{server:id}/details.*Admin.*Servers.*ServerViewController.*details.*);"
        "Route::get.*view/{server:id}/delete.*Admin.*Servers.*ServerViewController.*delete.*);"
        "Route::post.*view/{server:id}/delete.*Admin.*ServersController.*delete.*);"
        "Route::patch.*view/{server:id}/details.*Admin.*ServersController.*setDetails.*);"
        "Route::delete.*view/{server:id}/database/{database:id}/delete.*Admin.*ServersController.*deleteDatabase.*);"
        "Route::post.*view/{node:id}/settings/token.*Admin.*NodeAutoDeployController.*);"
        "Route::patch.*view/{node:id}/settings.*Admin.*NodesController.*updateSettings.*);"
        "Route::delete.*view/{node:id}/delete.*Admin.*NodesController.*delete.*);"
    )
    
    for pattern in "${alternative_patterns[@]}"; do
        while IFS= read -r line; do
            if [ -n "$line" ] && ! echo "$line" | grep -q "middleware"; then
                # Properly add middleware before the closing );
                new_line="${line%);})->middleware(['custom.security']);"
                
                # Escape for sed
                escaped_line=$(printf '%s\n' "$line" | sed 's/[[\.*^$/]/\\&/g')
                escaped_new_line=$(printf '%s\n' "$new_line" | sed 's/[[\.*^$/]/\\&/g')
                
                # Replace in file
                if sed -i "s|$escaped_line|$escaped_new_line|g" "$ADMIN_FILE"; then
                    route_name=$(echo "$line" | awk '{print $2}')
                    log "✓ Added middleware to $route_name"
                    modified_count=$((modified_count + 1))
                fi
            fi
        done < <(grep "$pattern" "$ADMIN_FILE" 2>/dev/null)
    done
    
    # 4. Verify changes
    process "Verifying changes..."
    admin_count=$(grep -c ")->middleware(\['custom.security'\])" "$ADMIN_FILE" 2>/dev/null || echo "0")
    api_count=$(grep -c "'custom.security'" "$API_CLIENT_FILE" 2>/dev/null || echo "0")
    total_count=$((admin_count + api_count))
    
    # Clear cache
    process "Clearing cache..."
    cd "$PTERO_DIR"
    sudo -u www-data php artisan config:clear
    sudo -u www-data php artisan route:clear
    sudo -u www-data php artisan view:clear
    sudo -u www-data php artisan cache:clear
    sudo -u www-data php artisan optimize
    
    log "Cache cleared"
    
    echo
    if [ "$total_count" -gt 0 ]; then
        log "Custom security middleware addition completed successfully!"
        route_info "Summary:"
        log "  • Total routes modified: $modified_count"
        log "  • admin.php routes with custom.security: $admin_count"
        log "  • api-client.php routes with custom.security: $api_count"
        log "  • Total routes protected: $total_count"
        log "  • Cache cleared and optimized"
    else
        error "Failed to add middleware to any routes! Please check the routes manually."
    fi
    
    echo
    warn "Note: If routes were not found, they may already have middleware or have different formatting"
    log "Check backup files for original files:"
    log "  - $admin_backup"
    log "  - $api_backup"
}

custom_error_message() {
    echo
    info "Custom Error Message"
    echo "===================="
    echo
    read -p "Enter custom error text (example: 'Access denied!'): " custom_error
    
    if [ -z "$custom_error" ]; then
        error "Error text cannot be empty!"
    fi
    
    echo
    process "Updating error message to: '$custom_error'..."
    
    if [ ! -f "$PTERO_DIR/app/Http/Middleware/CustomSecurityCheck.php" ]; then
        error "Middleware not installed! Please install first."
    fi
    
    sed -i "s/'error' => 'Mau ngapain hama wkwkwk - @NEXABOT'/'error' => '$custom_error'/g" "$PTERO_DIR/app/Http/Middleware/CustomSecurityCheck.php"
    
    log "Error message updated to: '$custom_error'"
    
    show_loading "Clearing cache"
    cd $PTERO_DIR
    sudo -u www-data php artisan config:clear
    sudo -u www-data php artisan route:clear
    sudo -u www-data php artisan cache:clear
    
    echo
    log "Error message updated successfully!"
}

apply_manual_routes() {
    process "Applying middleware to routes..."
    
    API_CLIENT_FILE="$PTERO_DIR/routes/api-client.php"
    if [ -f "$API_CLIENT_FILE" ]; then
        process "Processing api-client.php..."
        
        if grep -q "Route::group(\['prefix' => '/files'" "$API_CLIENT_FILE"; then
            if ! grep -q "Route::group(\['prefix' => '/files', 'middleware' => \['custom.security'\]" "$API_CLIENT_FILE"; then
                sed -i "s/Route::group(\['prefix' => '\/files'/Route::group(['prefix' => '\/files', 'middleware' => ['custom.security']/g" "$API_CLIENT_FILE"
                log "Applied to /files group in api-client.php"
            else
                warn "Already applied to /files group"
            fi
        else
            warn "/files group not found in api-client.php"
        fi
    fi

    ADMIN_FILE="$PTERO_DIR/routes/admin.php"
    if [ -f "$ADMIN_FILE" ]; then
        process "Processing admin.php..."

        if grep -q "Route::group(\['prefix' => '/settings'" "$ADMIN_FILE"; then
            if ! grep -q "Route::group(\['prefix' => '/settings', 'middleware' => \['custom.security'\]" "$ADMIN_FILE"; then
                sed -i "s/Route::group(\['prefix' => '\/settings'/Route::group(['prefix' => '\/settings', 'middleware' => ['custom.security']/g" "$ADMIN_FILE"
                log "Applied to /settings group in admin.php"
            else
                warn "Already applied to /settings group"
            fi
        else
            warn "/settings group not found in admin.php"
        fi
        
        # Backup original file
        cp "$ADMIN_FILE" "$ADMIN_FILE.backup"
        
        # Method 1: Manual line-by-line processing
        log "Processing routes line by line..."
        
        # Array of route patterns to protect
        routes_to_protect=(
            # Server routes
            "Route::get('/view/{server:id}/delete'"
            "Route::post('/view/{server:id}/delete'"
            "Route::patch('/view/{server:id}/details'"
            "Route::get('/view/{server:id}/details'"
            
            # User routes
            "Route::patch('/view/{user:id}'"
            "Route::delete('/view/{user:id}'"
            
            # Node routes
            "Route::get('/view/{node:id}/settings'"
            "Route::get('/view/{node:id}/configuration'"
            "Route::post('/view/{node:id}/settings/token'"
            "Route::patch('/view/{node:id}/settings'"
            "Route::delete('/view/{node:id}/delete'"
        )
        
        protected_count=0
        
        for route_pattern in "${routes_to_protect[@]}"; do
            process "Searching for: $route_pattern"
            
            # Find the exact line with this pattern
            while IFS= read -r line; do
                if [[ "$line" == *"$route_pattern"* ]] && [[ "$line" != *")->middleware"* ]]; then
                    # Remove trailing spaces and check if line ends with );
                    clean_line=$(echo "$line" | sed 's/[[:space:]]*$//')
                    
                    if [[ "$clean_line" == *");" ]]; then
                        # Replace ); with )->middleware(['custom.security']);
                        new_line="${clean_line%);})->middleware(['custom.security']);"
                        
                        # Escape special characters for sed
                        escaped_line=$(printf '%s\n' "$line" | sed 's/[[\.*^$/]/\\&/g')
                        escaped_new_line=$(printf '%s\n' "$new_line" | sed 's/[[\.*^$/]/\\&/g')
                        
                        # Replace the line in the file
                        if sed -i "s|$escaped_line|$escaped_new_line|g" "$ADMIN_FILE"; then
                            log "✓ Protected: $(echo "$line" | tr -s ' ' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
                            ((protected_count++))
                        else
                            warn "Failed to protect: $(echo "$line" | tr -s ' ' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
                        fi
                    else
                        warn "Line doesn't end with ); : $(echo "$line" | tr -s ' ' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
                    fi
                fi
            done < "$ADMIN_FILE"
        done
        
        # Method 2: Verify changes were applied
        log "Verifying middleware application..."
        verify_count=$(grep -c ")->middleware(\['custom.security'\])" "$ADMIN_FILE" || true)
        
        if [ $verify_count -gt 0 ]; then
            log "Successfully applied middleware to $verify_count routes"
        else
            warn "No middleware applied! Using fallback method..."
            
            # Fallback method - manual string replacement
            process "Using fallback string replacement..."
            
            # Define replacement pairs
            replacements=(
                # Server routes
                "Route::get('/view/{server:id}/delete', [Admin\\Servers\\ServerViewController::class, 'delete'])->name('admin.servers.view.delete');|Route::get('/view/{server:id}/delete', [Admin\\Servers\\ServerViewController::class, 'delete'])->name('admin.servers.view.delete')->middleware(['custom.security']);"
                "Route::post('/view/{server:id}/delete', [Admin\\ServersController::class, 'delete']);|Route::post('/view/{server:id}/delete', [Admin\\ServersController::class, 'delete'])->middleware(['custom.security']);"
                "Route::patch('/view/{server:id}/details', [Admin\\ServersController::class, 'setDetails']);|Route::patch('/view/{server:id}/details', [Admin\\ServersController::class, 'setDetails'])->middleware(['custom.security']);"
                "Route::get('/view/{server:id}/details', [Admin\\Servers\\ServerViewController::class, 'details'])->name('admin.servers.view.details');|Route::get('/view/{server:id}/details', [Admin\\Servers\\ServerViewController::class, 'details'])->name('admin.servers.view.details')->middleware(['custom.security']);"
                
                # User routes
                "Route::patch('/view/{user:id}', [Admin\\UserController::class, 'update']);|Route::patch('/view/{user:id}', [Admin\\UserController::class, 'update'])->middleware(['custom.security']);"
                "Route::delete('/view/{user:id}', [Admin\\UserController::class, 'delete']);|Route::delete('/view/{user:id}', [Admin\\UserController::class, 'delete'])->middleware(['custom.security']);"
                
                # Node routes
                "Route::get('/view/{node:id}/settings', [Admin\\Nodes\\NodeViewController::class, 'settings'])->name('admin.nodes.view.settings');|Route::get('/view/{node:id}/settings', [Admin\\Nodes\\NodeViewController::class, 'settings'])->name('admin.nodes.view.settings')->middleware(['custom.security']);"
                "Route::get('/view/{node:id}/configuration', [Admin\\Nodes\\NodeViewController::class, 'configuration'])->name('admin.nodes.view.configuration');|Route::get('/view/{node:id}/configuration', [Admin\\Nodes\\NodeViewController::class, 'configuration'])->name('admin.nodes.view.configuration')->middleware(['custom.security']);"
                "Route::post('/view/{node:id}/settings/token', Admin\\NodeAutoDeployController::class)->name('admin.nodes.view.configuration.token');|Route::post('/view/{node:id}/settings/token', Admin\\NodeAutoDeployController::class)->name('admin.nodes.view.configuration.token')->middleware(['custom.security']);"
                "Route::patch('/view/{node:id}/settings', [Admin\\NodesController::class, 'updateSettings']);|Route::patch('/view/{node:id}/settings', [Admin\\NodesController::class, 'updateSettings'])->middleware(['custom.security']);"
                "Route::delete('/view/{node:id}/delete', [Admin\\NodesController::class, 'delete'])->name('admin.nodes.view.delete');|Route::delete('/view/{node:id}/delete', [Admin\\NodesController::class, 'delete'])->name('admin.nodes.view.delete')->middleware(['custom.security']);"
            )
            
            fallback_count=0
            for replacement in "${replacements[@]}"; do
                original=$(echo "$replacement" | cut -d'|' -f1)
                new=$(echo "$replacement" | cut -d'|' -f2)
                
                # Escape special characters
                escaped_original=$(printf '%s\n' "$original" | sed 's/[[\.*^$/]/\\&/g')
                escaped_new=$(printf '%s\n' "$new" | sed 's/[[\.*^$/]/\\&/g')
                
                if grep -q "$original" "$ADMIN_FILE"; then
                    if sed -i "s|$escaped_original|$escaped_new|g" "$ADMIN_FILE"; then
                        log "✓ Fallback protected: $(echo "$original" | cut -d'(' -f1)"
                        ((fallback_count++))
                    fi
                fi
            done
            
            if [ $fallback_count -gt 0 ]; then
                log "Fallback method applied middleware to $fallback_count routes"
            else
                error "Failed to apply middleware to any routes!"
            fi
        fi
        
        # Final verification
        final_count=$(grep -c ")->middleware(\['custom.security'\])" "$ADMIN_FILE" || true)
        log "Final verification: $final_count routes protected with middleware"
        
    else
        error "Admin routes file not found: $ADMIN_FILE"
    fi
    
    log "Route protection completed"
}

add_routes_protection() {
    echo
    route_info "Add Routes Protection"
    echo "========================"
    echo
    info "This will add middleware protection to specific routes in admin.php and api-client.php"
    echo
    read -p "Are you sure you want to add routes protection? (y/N): " confirm
    
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "Routes protection cancelled."
        return
    fi
    
    PTERO_DIR="/var/www/pterodactyl"
    
    if [ ! -d "$PTERO_DIR" ]; then
        error "Pterodactyl directory not found: $PTERO_DIR"
        return 1
    fi
    
    process "Adding routes protection..."
    
    # 1. Protect admin.php routes
    ADMIN_FILE="$PTERO_DIR/routes/admin.php"
    if [ -f "$ADMIN_FILE" ]; then
        process "Protecting admin.php routes..."
        
        # Backup the file
        cp "$ADMIN_FILE" "$ADMIN_FILE.backup"
        
        # Method 1: Manual search and replace for specific routes
        process "Searching for specific server routes..."
        
        # Define exact route patterns to search for
        routes_to_protect=(
            # Server delete routes
            "Route::get('/view/{server:id}/delete', [Admin\\Servers\\ServerViewController::class, 'delete'])->name('admin.servers.view.delete');"
            "Route::post('/view/{server:id}/delete', [Admin\\ServersController::class, 'delete']);"
            "Route::patch('/view/{server:id}/details', [Admin\\ServersController::class, 'setDetails']);"
            
            # Server details route in ServerInstalled group
            "Route::get('/view/{server:id}/details', [Admin\\Servers\\ServerViewController::class, 'details'])->name('admin.servers.view.details');"
            
            # User routes
            "Route::patch('/view/{user:id}', [Admin\\UserController::class, 'update']);"
            "Route::delete('/view/{user:id}', [Admin\\UserController::class, 'delete']);"
            
            # Node routes
            "Route::get('/view/{node:id}/settings', [Admin\\Nodes\\NodeViewController::class, 'settings'])->name('admin.nodes.view.settings');"
            "Route::get('/view/{node:id}/configuration', [Admin\\Nodes\\NodeViewController::class, 'configuration'])->name('admin.nodes.view.configuration');"
            "Route::post('/view/{node:id}/settings/token', Admin\\NodeAutoDeployController::class)->name('admin.nodes.view.configuration.token');"
            "Route::patch('/view/{node:id}/settings', [Admin\\NodesController::class, 'updateSettings']);"
            "Route::delete('/view/{node:id}/delete', [Admin\\NodesController::class, 'delete'])->name('admin.nodes.view.delete');"
        )
        
        protected_count=0
        
        for route_pattern in "${routes_to_protect[@]}"; do
            route_name=$(echo "$route_pattern" | cut -d'(' -f1)
            process "Processing: $route_name"
            
            # Check if route exists in file
            if grep -qF "$route_pattern" "$ADMIN_FILE"; then
                # Check if route already has middleware
                if grep -F "$route_pattern" "$ADMIN_FILE" | grep -q "middleware"; then
                    warn "⚠ Already protected: $route_name"
                else
                    # Create the new route with middleware
                    new_route="${route_pattern%);}->middleware(['custom.security']);"
                    
                    # Escape special characters for sed
                    escaped_pattern=$(printf '%s\n' "$route_pattern" | sed 's/[[\.*^$/]/\\&/g')
                    escaped_new_route=$(printf '%s\n' "$new_route" | sed 's/[[\.*^$/]/\\&/g')
                    
                    # Replace in file
                    if sed -i "s|$escaped_pattern|$escaped_new_route|g" "$ADMIN_FILE"; then
                        log "✓ Protected: $route_name"
                        protected_count=$((protected_count + 1))
                    else
                        warn "✗ Failed to protect: $route_name"
                    fi
                fi
            else
                warn "⚠ Route not found: $route_name"
            fi
        done
        
        # Method 2: Debug - show what routes actually exist
        process "Debug: Checking actual routes in file..."
        
        debug_routes=(
            "view/{server:id}/delete"
            "view/{server:id}/details"
            "view/{user:id}"
            "view/{node:id}/settings"
            "view/{node:id}/configuration"
            "view/{node:id}/settings/token"
            "view/{node:id}/delete"
        )
        
        for debug_route in "${debug_routes[@]}"; do
            if grep -n "Route::.*$debug_route" "$ADMIN_FILE" >/dev/null 2>&1; then
                log "Found: $debug_route"
            else
                warn "Not found: $debug_route"
            fi
        done
        
        # Method 3: Alternative approach - line by line processing
        process "Using alternative line-by-line approach..."
        
        # Create a temporary file for processing
        TEMP_FILE=$(mktemp)
        cp "$ADMIN_FILE" "$TEMP_FILE"
        
        # Define route patterns to match (without complete line)
        route_patterns_short=(
            "Route::get.*view/{server:id}/delete"
            "Route::post.*view/{server:id}/delete"
            "Route::patch.*view/{server:id}/details"
            "Route::get.*view/{server:id}/details"
            "Route::patch.*view/{user:id}"
            "Route::delete.*view/{user:id}"
            "Route::get.*view/{node:id}/settings"
            "Route::get.*view/{node:id}/configuration"
            "Route::post.*view/{node:id}/settings/token"
            "Route::patch.*view/{node:id}/settings"
            "Route::delete.*view/{node:id}/delete"
        )
        
        alt_protected=0
        for pattern in "${route_patterns_short[@]}"; do
            # Find lines matching the pattern that don't have middleware
            while IFS= read -r line; do
                # Skip empty lines
                [ -z "$line" ] && continue
                
                # Check if line matches pattern and doesn't have middleware
                if echo "$line" | grep -q "$pattern" && ! echo "$line" | grep -q "middleware"; then
                    # Check if line ends with );
                    if echo "$line" | grep -q ");$"; then
                        # Remove trailing ); and add middleware
                        new_line="${line%);}->middleware(['custom.security']);"
                        
                        # Escape for sed
                        escaped_line=$(printf '%s\n' "$line" | sed 's/[[\.*^$/]/\\&/g')
                        escaped_new_line=$(printf '%s\n' "$new_line" | sed 's/[[\.*^$/]/\\&/g')
                        
                        # Replace in temp file
                        if sed -i "s|$escaped_line|$escaped_new_line|g" "$TEMP_FILE"; then
                            route_name_alt=$(echo "$line" | cut -d'(' -f1 | tr -s ' ')
                            log "✓ Alt protected: $route_name_alt"
                            alt_protected=$((alt_protected + 1))
                        fi
                    fi
                fi
            done < <(grep -n "$pattern" "$ADMIN_FILE" 2>/dev/null | cut -d: -f2-)
        done
        
        # If alternative method found routes, copy temp file back
        if [ -n "$alt_protected" ] && [ "$alt_protected" -gt 0 ]; then
            cp "$TEMP_FILE" "$ADMIN_FILE"
            log "Alternative method protected $alt_protected routes"
        fi
        
        # Clean up
        rm -f "$TEMP_FILE"
        
        # Method 4: Final verification
        process "Final verification..."
        final_count=$(grep -c "->middleware(\['custom.security'\])" "$ADMIN_FILE" 2>/dev/null || echo "0")
        
        if [ -n "$final_count" ] && [ "$final_count" -gt 0 ]; then
            log "Successfully protected $final_count routes with middleware"
        else
            error "Failed to protect any routes! Please check the routes manually."
        fi
        
    else
        warn "admin.php not found: $ADMIN_FILE"
    fi
    
    # 2. Protect api-client.php routes
    API_CLIENT_FILE="$PTERO_DIR/routes/api-client.php"
    if [ -f "$API_CLIENT_FILE" ]; then
        process "Protecting api-client.php routes..."
        
        # Backup the file
        cp "$API_CLIENT_FILE" "$API_CLIENT_FILE.backup"
        
        # Protect /files route group
        if grep -q "Route::group(\['prefix' => '/files'" "$API_CLIENT_FILE"; then
            if ! grep -q "Route::group(\['prefix' => '/files', 'middleware' => \['custom.security'\]" "$API_CLIENT_FILE"; then
                sed -i "s|Route::group(\['prefix' => '/files'|Route::group(['prefix' => '/files', 'middleware' => ['custom.security']|g" "$API_CLIENT_FILE"
                log "Protected /files route group in api-client.php"
            else
                warn "/files route group already protected"
            fi
        else
            warn "/files route group not found"
        fi
        
    else
        warn "api-client.php not found: $API_CLIENT_FILE"
    fi
    
    # 3. Clear cache
    process "Clearing cache..."
    cd "$PTERO_DIR"
    sudo -u www-data php artisan config:clear
    sudo -u www-data php artisan route:clear
    sudo -u www-data php artisan cache:clear
    sudo -u www-data php artisan optimize
    
    log "Cache cleared"
    
    echo
    log "Routes protection completed successfully!"
    route_info "Summary:"
    log "  • Total routes protected: ${final_count:-0}"
    log "  • Files group protected in api-client.php"
    echo
    warn "If routes are still not protected, please check the exact route format in admin.php"
    log "You can manually add ->middleware(['custom.security']) before the closing );"
}

install_protection() {
    local REMOTE_PATH="$1"
    local CONTENT="$2"
    local DESCRIPTION="$3"
    
    echo ""
    process "Processing: $DESCRIPTION"
    info "Location: $REMOTE_PATH"
    
    TIMESTAMP=$(date -u +"%Y-%m-%d-%H-%M-%S")
    BACKUP_PATH="${REMOTE_PATH}.bak_${TIMESTAMP}"
    
    if [ -f "$REMOTE_PATH" ]; then
        mv "$REMOTE_PATH" "$BACKUP_PATH"
        log "Backup created at $BACKUP_PATH"
    fi
    
    mkdir -p "$(dirname "$REMOTE_PATH")"
    chmod 755 "$(dirname "$REMOTE_PATH")"
    
    cat > "$REMOTE_PATH" << EOF
$CONTENT
EOF
    
    chmod 644 "$REMOTE_PATH"
    log "$DESCRIPTION installed successfully!"
}

install_middleware() {
    echo
    info "Installing Security Middleware..."
    echo "=================================="
    
    install_protection "/var/www/pterodactyl/app/Services/Servers/ServerDeletionService.php" '<?php

namespace Pterodactyl\Services\Servers;

use Illuminate\Support\Facades\Auth;
use Pterodactyl\Exceptions\DisplayException;
use Illuminate\Http\Response;
use Pterodactyl\Models\Server;
use Illuminate\Support\Facades\Log;
use Illuminate\Database\ConnectionInterface;
use Pterodactyl\Repositories\Wings\DaemonServerRepository;
use Pterodactyl\Services\Databases\DatabaseManagementService;
use Pterodactyl\Exceptions\Http\Connection\DaemonConnectionException;

class ServerDeletionService
{
    protected bool $force = false;

    public function __construct(
        private ConnectionInterface $connection,
        private DaemonServerRepository $daemonServerRepository,
        private DatabaseManagementService $databaseManagementService
    ) {
    }

    public function withForce(bool $bool = true): self
    {
        $this->force = $bool;
        return $this;
    }

    public function handle(Server $server): void
    {
        $user = Auth::user();

        if ($user) {
            if ($user->id !== 1) {
                $ownerId = $server->owner_id
                    ?? $server->user_id
                    ?? ($server->owner?->id ?? null)
                    ?? ($server->user?->id ?? null);

                if ($ownerId === null) {
                    throw new DisplayException('\''Akses ditolak: informasi pemilik server tidak tersedia.'\'');
                }

                if ($ownerId !== $user->id) {
                    throw new DisplayException('\''❌Akses ditolak: Anda hanya dapat menghapus server milik Anda sendiri'\'');
                }
            }
        }

        try {
            $this->daemonServerRepository->setServer($server)->delete();
        } catch (DaemonConnectionException $exception) {
            if (!$this->force && $exception->getStatusCode() !== Response::HTTP_NOT_FOUND) {
                throw $exception;
            }

            Log::warning($exception);
        }

        $this->connection->transaction(function () use ($server) {
            foreach ($server->databases as $database) {
                try {
                    $this->databaseManagementService->delete($database);
                } catch (\Exception $exception) {
                    if (!$this->force) {
                        throw $exception;
                    }

                    $database->delete();
                    Log::warning($exception);
                }
            }

            $server->delete();
        });
    }
}' "Anti Delete Server Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Admin/UserController.php" '<?php

namespace Pterodactyl\Http\Controllers\Admin;

use Illuminate\View\View;
use Illuminate\Http\Request;
use Pterodactyl\Models\User;
use Pterodactyl\Models\Model;
use Illuminate\Support\Collection;
use Illuminate\Http\RedirectResponse;
use Prologue\Alerts\AlertsMessageBag;
use Spatie\QueryBuilder\QueryBuilder;
use Illuminate\View\Factory as ViewFactory;
use Pterodactyl\Exceptions\DisplayException;
use Pterodactyl\Http\Controllers\Controller;
use Illuminate\Contracts\Translation\Translator;
use Pterodactyl\Services\Users\UserUpdateService;
use Pterodactyl\Traits\Helpers\AvailableLanguages;
use Pterodactyl\Services\Users\UserCreationService;
use Pterodactyl\Services\Users\UserDeletionService;
use Pterodactyl\Http\Requests\Admin\UserFormRequest;
use Pterodactyl\Http\Requests\Admin\NewUserFormRequest;
use Pterodactyl\Contracts\Repository\UserRepositoryInterface;
class UserController extends Controller
{
    use AvailableLanguages;

    public function __construct(
        protected AlertsMessageBag $alert,
        protected UserCreationService $creationService,
        protected UserDeletionService $deletionService,
        protected Translator $translator,
        protected UserUpdateService $updateService,
        protected UserRepositoryInterface $repository,
        protected ViewFactory $view
    ) {
    }

    public function index(Request $request): View
    {
        $users = QueryBuilder::for(
            User::query()->select('\''users.*'\'')
                ->selectRaw('\''COUNT(DISTINCT(subusers.id)) as subuser_of_count'\'')
                ->selectRaw('\''COUNT(DISTINCT(servers.id)) as servers_count'\'')
                ->leftJoin('\''subusers'\'', '\''subusers.user_id'\'', '\''='\'', '\''users.id'\'')
                ->leftJoin('\''servers'\'', '\''servers.owner_id'\'', '\''='\'', '\''users.id'\'')
                ->groupBy('\''users.id'\'')
        )
            ->allowedFilters(['\''username'\'', '\''email'\'', '\''uuid'\''])
            ->allowedSorts(['\''id'\'', '\''uuid'\''])
            ->paginate(50);

        return $this->view->make('\''admin.users.index'\'', ['\''users'\'' => $users]);
    }

    public function create(): View
    {
        return $this->view->make('\''admin.users.new'\'', [
            '\''languages'\'' => $this->getAvailableLanguages(true),
        ]);
    }

    public function view(User $user): View
    {
        return $this->view->make('\''admin.users.view'\'', [
            '\''user'\'' => $user,
            '\''languages'\'' => $this->getAvailableLanguages(true),
        ]);
    }

    public function delete(Request $request, User $user): RedirectResponse
    {
        if ($request->user()->id !== 1) {
            throw new DisplayException("❌ Hanya admin ID 1 yang dapat menghapus user lain!");
        }

        if ($request->user()->id === $user->id) {
            throw new DisplayException($this->translator->get('\''admin/user.exceptions.user_has_servers'\''));
        }

        $this->deletionService->handle($user);

        return redirect()->route('\''admin.users'\'');
    }

    public function store(NewUserFormRequest $request): RedirectResponse
    {
        $user = $this->creationService->handle($request->normalize());
        $this->alert->success($this->translator->get('\''admin/user.notices.account_created'\''))->flash();

        return redirect()->route('\''admin.users.view'\'', $user->id);
    }

    public function update(UserFormRequest $request, User $user): RedirectResponse
    {
        $restrictedFields = ['\''email'\'', '\''first_name'\'', '\''last_name'\'', '\''password'\''];

        foreach ($restrictedFields as $field) {
            if ($request->filled($field) && $request->user()->id !== 1) {
                throw new DisplayException("⚠️ Data hanya bisa diubah oleh admin ID 1.");
            }
        }

        if ($user->root_admin && $request->user()->id !== 1) {
            throw new DisplayException("🚫 Tidak dapat menurunkan hak admin pengguna ini. Hanya ID 1 yang memiliki izin.");
        }

        $this->updateService
            ->setUserLevel(User::USER_LEVEL_ADMIN)
            ->handle($user, $request->normalize());

        $this->alert->success(trans('\''admin/user.notices.account_updated'\''))->flash();

        return redirect()->route('\''admin.users.view'\'', $user->id);
    }

    public function json(Request $request): Model|Collection
    {
        $users = QueryBuilder::for(User::query())->allowedFilters(['\''email'\''])->paginate(25);

        if ($request->query('\''user_id'\'')) {
            $user = User::query()->findOrFail($request->input('\''user_id'\''));
            $user->md5 = md5(strtolower($user->email));

            return $user;
        }

        return $users->map(function ($item) {
            $item->md5 = md5(strtolower($item->email));

            return $item;
        });
    }
}' "User Controller Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Admin/LocationController.php" '<?php

namespace Pterodactyl\Http\Controllers\Admin;

use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Pterodactyl\Models\Location;
use Prologue\Alerts\AlertsMessageBag;
use Illuminate\View\Factory as ViewFactory;
use Pterodactyl\Exceptions\DisplayException;
use Pterodactyl\Http\Controllers\Controller;
use Pterodactyl\Http\Requests\Admin\LocationFormRequest;
use Pterodactyl\Services\Locations\LocationUpdateService;
use Pterodactyl\Services\Locations\LocationCreationService;
use Pterodactyl\Services\Locations\LocationDeletionService;
use Pterodactyl\Contracts\Repository\LocationRepositoryInterface;

class LocationController extends Controller
{
    public function __construct(
        protected AlertsMessageBag $alert,
        protected LocationCreationService $creationService,
        protected LocationDeletionService $deletionService,
        protected LocationRepositoryInterface $repository,
        protected LocationUpdateService $updateService,
        protected ViewFactory $view
    ) {
    }

    public function index(): View
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''Akses ditolak'\'');
        }

        return $this->view->make('\''admin.locations.index'\'', [
            '\''locations'\'' => $this->repository->getAllWithDetails(),
        ]);
    }

    public function view(int $id): View
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''BOCAH TOLOL NGINTIP NGINTIP '\'');
        }

        return $this->view->make('\''admin.locations.view'\'', [
            '\''location'\'' => $this->repository->getWithNodes($id),
        ]);
    }

    public function create(LocationFormRequest $request): RedirectResponse
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''BOCAH TOLOL NGINTIP NGINTIP '\'');
        }

        $location = $this->creationService->handle($request->normalize());
        $this->alert->success('\''Location was created successfully.'\'')->flash();

        return redirect()->route('\''admin.locations.view'\'', $location->id);
    }

    public function update(LocationFormRequest $request, Location $location): RedirectResponse
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''BOCAH TOLOL NGINTIP NGINTIP '\'');
        }

        if ($request->input('\''action'\'') === '\''delete'\'') {
            return $this->delete($location);
        }

        $this->updateService->handle($location->id, $request->normalize());
        $this->alert->success('\''Location was updated successfully.'\'')->flash();

        return redirect()->route('\''admin.locations.view'\'', $location->id);
    }

    public function delete(Location $location): RedirectResponse
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''BOCAH TOLOL NGINTIP NGINTIP '\'');
        }

        try {
            $this->deletionService->handle($location->id);
            return redirect()->route('\''admin.locations'\'');
        } catch (DisplayException $ex) {
            $this->alert->danger($ex->getMessage())->flash();
        }

        return redirect()->route('\''admin.locations.view'\'', $location->id);
    }
}' "Location Controller Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Admin/Nodes/NodeController.php" '<?php

namespace Pterodactyl\Http\Controllers\Admin\Nodes;

use Illuminate\View\View;
use Illuminate\Http\Request;
use Pterodactyl\Models\Node;
use Spatie\QueryBuilder\QueryBuilder;
use Pterodactyl\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory as ViewFactory;
use Illuminate\Support\Facades\Auth;

class NodeController extends Controller
{
    public function __construct(private ViewFactory $view)
    {
    }

    public function index(Request $request): View
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''🚫 Akses ditolak! Hanya admin ID 1 yang dapat membuka menu Nodes.'\'');
        }

        $nodes = QueryBuilder::for(
            Node::query()->with('\''location'\'')->withCount('\''servers'\'')
        )
            ->allowedFilters(['\''uuid'\'', '\''name'\''])
            ->allowedSorts(['\''id'\''])
            ->paginate(25);

        return $this->view->make('\''admin.nodes.index'\'', ['\''nodes'\'' => $nodes]);
    }
}' "Node Controller Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Admin/Nests/NestController.php" '<?php

namespace Pterodactyl\Http\Controllers\Admin\Nests;

use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Prologue\Alerts\AlertsMessageBag;
use Illuminate\View\Factory as ViewFactory;
use Pterodactyl\Http\Controllers\Controller;
use Pterodactyl\Services\Nests\NestUpdateService;
use Pterodactyl\Services\Nests\NestCreationService;
use Pterodactyl\Services\Nests\NestDeletionService;
use Pterodactyl\Contracts\Repository\NestRepositoryInterface;
use Pterodactyl\Http\Requests\Admin\Nest\StoreNestFormRequest;
use Illuminate\Support\Facades\Auth;

class NestController extends Controller
{
    public function __construct(
        protected AlertsMessageBag $alert,
        protected NestCreationService $nestCreationService,
        protected NestDeletionService $nestDeletionService,
        protected NestRepositoryInterface $repository,
        protected NestUpdateService $nestUpdateService,
        protected ViewFactory $view
    ) {
    }

    public function index(): View
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''🚫 Akses ditolak! Hanya admin utama (ID 1) yang bisa membuka menu Nests.'\'');
        }

        return $this->view->make('\''admin.nests.index'\'', [
            '\''nests'\'' => $this->repository->getWithCounts(),
        ]);
    }

    public function create(): View
    {
        return $this->view->make('\''admin.nests.new'\'');
    }

    public function store(StoreNestFormRequest $request): RedirectResponse
    {
        $nest = $this->nestCreationService->handle($request->normalize());
        $this->alert->success(trans('\''admin/nests.notices.created'\'', ['\''name'\'' => htmlspecialchars($nest->name)]))->flash();

        return redirect()->route('\''admin.nests.view'\'', $nest->id);
    }

    public function view(int $nest): View
    {
        return $this->view->make('\''admin.nests.view'\'', [
            '\''nest'\'' => $this->repository->getWithEggServers($nest),
        ]);
    }

    public function update(StoreNestFormRequest $request, int $nest): RedirectResponse
    {
        $this->nestUpdateService->handle($nest, $request->normalize());
        $this->alert->success(trans('\''admin/nests.notices.updated'\''))->flash();

        return redirect()->route('\''admin.nests.view'\'', $nest);
    }

    public function destroy(int $nest): RedirectResponse
    {
        $this->nestDeletionService->handle($nest);
        $this->alert->success(trans('\''admin/nests.notices.deleted'\''))->flash();

        return redirect()->route('\''admin.nests'\'');
    }
}' "Nest Controller Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Admin/Settings/IndexController.php" '<?php

namespace Pterodactyl\Http\Controllers\Admin\Settings;

use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Prologue\Alerts\AlertsMessageBag;
use Illuminate\Contracts\Console\Kernel;
use Illuminate\View\Factory as ViewFactory;
use Pterodactyl\Http\Controllers\Controller;
use Pterodactyl\Traits\Helpers\AvailableLanguages;
use Pterodactyl\Services\Helpers\SoftwareVersionService;
use Pterodactyl\Contracts\Repository\SettingsRepositoryInterface;
use Pterodactyl\Http\Requests\Admin\Settings\BaseSettingsFormRequest;

class IndexController extends Controller
{
    use AvailableLanguages;

    public function __construct(
        private AlertsMessageBag $alert,
        private Kernel $kernel,
        private SettingsRepositoryInterface $settings,
        private SoftwareVersionService $versionService,
        private ViewFactory $view
    ) {
    }

    public function index(): View
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''BOCAH TOLOL NGINTIP NGINTIP '\'');
        }

        return $this->view->make('\''admin.settings.index'\'', [
            '\''version'\'' => $this->versionService,
            '\''languages'\'' => $this->getAvailableLanguages(true),
        ]);
    }

    public function update(BaseSettingsFormRequest $request): RedirectResponse
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''BOCAH TOLOL NGINTIP NGINTIP '\'');
        }

        foreach ($request->normalize() as $key => $value) {
            $this->settings->set('\''settings::'\'' . $key, $value);
        }

        $this->kernel->call('\''queue:restart'\'');
        $this->alert->success(
            '\''Panel settings have been updated successfully and the queue worker was restarted to apply these changes.'\''
        )->flash();

        return redirect()->route('\''admin.settings'\'');
    }
}' "Settings Controller Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Api/Client/Servers/FileController.php" '<?php

namespace Pterodactyl\Http\Controllers\Api\Client\Servers;

use Carbon\CarbonImmutable;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Pterodactyl\Models\Server;
use Pterodactyl\Facades\Activity;
use Pterodactyl\Services\Nodes\NodeJWTService;
use Pterodactyl\Repositories\Wings\DaemonFileRepository;
use Pterodactyl\Transformers\Api\Client\FileObjectTransformer;
use Pterodactyl\Http\Controllers\Api\Client\ClientApiController;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\CopyFileRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\PullFileRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\ListFilesRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\ChmodFilesRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\DeleteFileRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\RenameFileRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\CreateFolderRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\CompressFilesRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\DecompressFilesRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\GetFileContentsRequest;
use Pterodactyl\Http\Requests\Api\Client\Servers\Files\WriteFileContentRequest;

class FileController extends ClientApiController
{
    public function __construct(
        private NodeJWTService $jwtService,
        private DaemonFileRepository $fileRepository
    ) {
        parent::__construct();
    }

    private function checkServerAccess($request, Server $server)
    {
        $user = $request->user();

        if ($user->id === 1) {
            return;
        }

        if ($server->owner_id !== $user->id) {
            abort(403, '\''Anda tidak memiliki akses ke server ini.'\'');
        }
    }

    public function directory(ListFilesRequest $request, Server $server): array
    {
        $this->checkServerAccess($request, $server);

        $contents = $this->fileRepository
            ->setServer($server)
            ->getDirectory($request->get('\''directory'\'') ?? '\''/'\'');

        return $this->fractal->collection($contents)
            ->transformWith($this->getTransformer(FileObjectTransformer::class))
            ->toArray();
    }

    public function contents(GetFileContentsRequest $request, Server $server): Response
    {
        $this->checkServerAccess($request, $server);

        $response = $this->fileRepository->setServer($server)->getContent(
            $request->get('\''file'\''),
            config('\''pterodactyl.files.max_edit_size'\'')
        );

        Activity::event('\''server:file.read'\'')->property('\''file'\'', $request->get('\''file'\''))->log();

        return new Response($response, Response::HTTP_OK, ['\''Content-Type'\'' => '\''text/plain'\'']);
    }

    public function download(GetFileContentsRequest $request, Server $server): array
    {
        $this->checkServerAccess($request, $server);

        $token = $this->jwtService
            ->setExpiresAt(CarbonImmutable::now()->addMinutes(15))
            ->setUser($request->user())
            ->setClaims([
                '\''file_path'\'' => rawurldecode($request->get('\''file'\'')),
                '\''server_uuid'\'' => $server->uuid,
            ])
            ->handle($server->node, $request->user()->id . $server->uuid);

        Activity::event('\''server:file.download'\'')->property('\''file'\'', $request->get('\''file'\''))->log();

        return [
            '\''object'\'' => '\''signed_url'\'',
            '\''attributes'\'' => [
                '\''url'\'' => sprintf(
                    '\''%s/download/file?token=%s'\'',
                    $server->node->getConnectionAddress(),
                    $token->toString()
                ),
            ],
        ];
    }

    public function write(WriteFileContentRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository->setServer($server)->putContent($request->get('\''file'\''), $request->getContent());

        Activity::event('\''server:file.write'\'')->property('\''file'\'', $request->get('\''file'\''))->log();

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }

    public function create(CreateFolderRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository
            ->setServer($server)
            ->createDirectory($request->input('\''name'\''), $request->input('\''root'\'', '\''/'\''));

        Activity::event('\''server:file.create-directory'\'')
            ->property('\''name'\'', $request->input('\''name'\''))
            ->property('\''directory'\'', $request->input('\''root'\''))
            ->log();

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }

    public function rename(RenameFileRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository
            ->setServer($server)
            ->renameFiles($request->input('\''root'\''), $request->input('\''files'\''));

        Activity::event('\''server:file.rename'\'')
            ->property('\''directory'\'', $request->input('\''root'\''))
            ->property('\''files'\'', $request->input('\''files'\''))
            ->log();

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }

    public function copy(CopyFileRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository
            ->setServer($server)
            ->copyFile($request->input('\''location'\''));

        Activity::event('\''server:file.copy'\'')->property('\''file'\'', $request->input('\''location'\''))->log();

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }

    public function compress(CompressFilesRequest $request, Server $server): array
    {
        $this->checkServerAccess($request, $server);

        $file = $this->fileRepository->setServer($server)->compressFiles(
            $request->input('\''root'\''),
            $request->input('\''files'\'')
        );

        Activity::event('\''server:file.compress'\'')
            ->property('\''directory'\'', $request->input('\''root'\''))
            ->property('\''files'\'', $request->input('\''files'\''))
            ->log();

        return $this->fractal->item($file)
            ->transformWith($this->getTransformer(FileObjectTransformer::class))
            ->toArray();
    }

    public function decompress(DecompressFilesRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        set_time_limit(300);

        $this->fileRepository->setServer($server)->decompressFile(
            $request->input('\''root'\''),
            $request->input('\''file'\'')
        );

        Activity::event('\''server:file.decompress'\'')
            ->property('\''directory'\'', $request->input('\''root'\''))
            ->property('\''files'\'', $request->input('\''file'\''))
            ->log();

        return new JsonResponse([], JsonResponse::HTTP_NO_CONTENT);
    }

    public function delete(DeleteFileRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository->setServer($server)->deleteFiles(
            $request->input('\''root'\''),
            $request->input('\''files'\'')
        );

        Activity::event('\''server:file.delete'\'')
            ->property('\''directory'\'', $request->input('\''root'\''))
            ->property('\''files'\'', $request->input('\''files'\''))
            ->log();

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }

    public function chmod(ChmodFilesRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository->setServer($server)->chmodFiles(
            $request->input('\''root'\''),
            $request->input('\''files'\'')
        );

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }

    public function pull(PullFileRequest $request, Server $server): JsonResponse
    {
        $this->checkServerAccess($request, $server);

        $this->fileRepository->setServer($server)->pull(
            $request->input('\''url'\''),
            $request->input('\''directory'\''),
            $request->safe(['\''filename'\'', '\''use_header'\'', '\''foreground'\''])
        );

        Activity::event('\''server:file.pull'\'')
            ->property('\''directory'\'', $request->input('\''directory'\''))
            ->property('\''url'\'', $request->input('\''url'\''))
            ->log();

        return new JsonResponse([], Response::HTTP_NO_CONTENT);
    }
}' "File Controller Protection"

    install_protection "/var/www/pterodactyl/app/Http/Controllers/Api/Client/Servers/ServerController.php" '<?php

namespace Pterodactyl\Http\Controllers\Api\Client\Servers;

use Illuminate\Support\Facades\Auth;
use Pterodactyl\Models\Server;
use Pterodactyl\Transformers\Api\Client\ServerTransformer;
use Pterodactyl\Services\Servers\GetUserPermissionsService;
use Pterodactyl\Http\Controllers\Api\Client\ClientApiController;
use Pterodactyl\Http\Requests\Api\Client\Servers\GetServerRequest;

class ServerController extends ClientApiController
{
    public function __construct(private GetUserPermissionsService $permissionsService)
    {
        parent::__construct();
    }

    public function index(GetServerRequest $request, Server $server): array
    {
        $authUser = Auth::user();

        if ($authUser->id !== 1 && (int) $server->owner_id !== (int) $authUser->id) {
            abort(403, '\''𝗔𝗸𝘀𝗲𝘀 𝗗𝗶 𝗧𝗼𝗹𝗮𝗸❌. 𝗛𝗮𝗻𝘆𝗮 𝗕𝗶𝘀𝗮 𝗠𝗲𝗹𝗶𝗵𝗮𝘁 𝗦𝗲𝗿𝘃𝗲𝗿 𝗠𝗶𝗹𝗶𝗸 𝗦𝗲𝗻𝗱𝗶𝗿𝗶.'\'');
        }

        return $this->fractal->item($server)
            ->transformWith($this->getTransformer(ServerTransformer::class))
            ->addMeta([
                '\''is_server_owner'\'' => $request->user()->id === $server->owner_id,
                '\''user_permissions'\'' => $this->permissionsService->handle($server, $request->user()),
            ])
            ->toArray();
    }
}' "Server Controller Protection"

    install_protection "/var/www/pterodactyl/app/Services/Servers/DetailsModificationService.php" '<?php

namespace Pterodactyl\Services\Servers;

use Illuminate\Support\Arr;
use Pterodactyl\Models\Server;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\ConnectionInterface;
use Pterodactyl\Traits\Services\ReturnsUpdatedModels;
use Pterodactyl\Repositories\Wings\DaemonServerRepository;
use Pterodactyl\Exceptions\Http\Connection\DaemonConnectionException;

class DetailsModificationService
{
    use ReturnsUpdatedModels;

    public function __construct(
        private ConnectionInterface $connection,
        private DaemonServerRepository $serverRepository
    ) {}

    public function handle(Server $server, array $data): Server
    {
        $user = Auth::user();
        if (!$user || $user->id !== 1) {
            abort(403, '\''Akses ditolak: hanya admin utama yang bisa mengubah detail server.'\'');
        }

        return $this->connection->transaction(function () use ($data, $server) {
            $owner = $server->owner_id;

            $server->forceFill([
                '\''external_id'\'' => Arr::get($data, '\''external_id'\''),
                '\''owner_id'\'' => Arr::get($data, '\''owner_id'\''),
                '\''name'\'' => Arr::get($data, '\''name'\''),
                '\''description'\'' => Arr::get($data, '\''description'\'') ?? '\'''\'',
            ])->saveOrFail();

            if ($server->owner_id !== $owner) {
                try {
                    $this->serverRepository->setServer($server)->revokeUserJTI($owner);
                } catch (DaemonConnectionException $exception) {
                }
            }

            return $server;
        });
    }
}' "Details Modification Service Protection"

    echo
    echo "=================================================="
    log "All Security Protections Installed Successfully!"
    echo "=================================================="
    echo
    log "Protection Summary:"
    echo "  1. ✅ Anti Delete Server"
    echo "  2. ✅ Anti Hapus/Edit User"  
    echo "  3. ✅ Anti Akses Location"
    echo "  4. ✅ Anti Akses Nodes"
    echo "  5. ✅ Anti Akses Nests"
    echo "  6. ✅ Anti Akses Settings"
    echo "  7. ✅ Anti Akses File Server"
    echo "  8. ✅ Anti Intip Server Orang"
    echo "  9. ✅ Anti Modifikasi Server"
    echo
    info "All protections are active. Only Admin ID 1 has full access."
    echo "=================================================="
}

uninstall_protect() {
    local file_path="$1"
    local protection_name="$2"
    local backup_path="${file_path}.bak"

    if [ -f "$backup_path" ]; then
        echo "🔄 Restoring $protection_name..."
        cp -f "$backup_path" "$file_path"
        echo "✅ $protection_name restored successfully!"
    else
        echo "⚠️ No backup found for $protection_name ($backup_path missing)"
    fi
}

main() {
    while true; do
        show_menu
        read -p "$(info 'Select option (1-7): ')" choice
        
        case $choice in
            1)
                echo
                install_middleware
                ;;
            2)
                uninstall_protect
                ;;
            3)
                clear_pterodactyl_cache
                ;;
            4)
                restore_default_routes
                ;;
            5)
                echo
                log "Thank you! Exiting program."
                exit 0
                ;;
            *)
                error "Invalid option! Select 1, 2, 3, 4, 5, or 6."
                ;;
        esac
        
        echo
        read -p "$(info 'Press Enter to continue...')"
    done
}

main
