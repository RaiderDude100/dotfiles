#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
GITHUB_REPO="https://github.com/RaiderDude100/dotfiles.git"

log() {
    echo "[INFO] $1"
}

warn() {
    echo "[WARN] $1"
}

error() {
    echo "[ERROR] $1" >&2
}

backup_existing() {
    if [ -d "$DOTFILES_DIR" ]; then
        warn "Backing up existing dotfiles to $BACKUP_DIR"
        mv "$DOTFILES_DIR" "$BACKUP_DIR"
    fi
}

update_dotfiles() {
    log "Updating dotfiles from GitHub..."
    
    if [ -d "$DOTFILES_DIR" ]; then
        log "Dotfiles directory exists, pulling latest changes..."
        cd "$DOTFILES_DIR"
        git stash push -m "Auto-stash before update" || true
        git pull origin main
        git stash pop || true
    else
        log "Cloning fresh dotfiles..."
        git clone "$GITHUB_REPO" "$DOTFILES_DIR"
        cd "$DOTFILES_DIR"
    fi
    
    log "Dotfiles updated successfully"
}

install_dependencies() {
    log "Checking for required dependencies..."
    
    if ! command -v stow >/dev/null 2>&1; then
        warn "GNU Stow not found. Installing..."
        if command -v yay >/dev/null 2>&1; then
            yay -S --noconfirm stow
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm stow
        else
            error "Cannot install stow. Please install it manually."
            exit 1
        fi
    fi
    
    if ! command -v git >/dev/null 2>&1; then
        error "Git is required but not found. Please install it first."
        exit 1
    fi
}

run_installer() {
    log "Running dotfiles installer..."
    
    if [ -f "$DOTFILES_DIR/installer.sh" ]; then
        cd "$DOTFILES_DIR"
        chmod +x installer.sh
        ./installer.sh
    else
        error "installer.sh not found in dotfiles directory"
        exit 1
    fi
}

cleanup() {
    log "Cleaning up..."
    if [ -d "$BACKUP_DIR" ] && [ "$1" != "--keep-backup" ]; then
        warn "Removing backup directory (use --keep-backup to preserve)"
        rm -rf "$BACKUP_DIR"
    fi
}

show_help() {
    cat << EOF
Dotfiles Updater Script

Usage: $0 [OPTIONS]

Options:
    --help, -h          Show this help message
    --backup-only       Only backup existing dotfiles, don't update
    --no-install        Update dotfiles but don't run installer
    --keep-backup       Keep backup directory after update
    --force             Force update even if no changes detected

Examples:
    $0                  # Full update and install
    $0 --no-install     # Update only, don't run installer
    $0 --keep-backup    # Update and keep backup
EOF
}

main() {
    local backup_only=false
    local no_install=false
    local keep_backup=false
    local force=false
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --help|-h)
                show_help
                exit 0
                ;;
            --backup-only)
                backup_only=true
                shift
                ;;
            --no-install)
                no_install=true
                shift
                ;;
            --keep-backup)
                keep_backup=true
                shift
                ;;
            --force)
                force=true
                shift
                ;;
            *)
                error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    log "Starting dotfiles update process..."
    
    install_dependencies
    
    if [ "$backup_only" = true ]; then
        backup_existing
        log "Backup completed. Exiting."
        exit 0
    fi
    
    backup_existing
    update_dotfiles
    
    if [ "$no_install" = false ]; then
        run_installer
    else
        log "Skipping installer as requested"
    fi
    
    cleanup "$([ "$keep_backup" = true ] && echo "--keep-backup" || echo "")"
    
    log "Dotfiles update completed successfully!"
    log "Please restart your session for changes to take effect."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi