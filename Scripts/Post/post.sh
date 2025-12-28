#!/bin/sh
set -e

USER_NAME="$(whoami)"
HOME_DIR="$HOME"

# --- System setup ---
sudo usermod -aG gamemode "$USER_NAME"

sudo reflector --latest 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist

# --- Desktop theming ---
waypaper --random

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.interface icon-theme "kora"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"

# --- Oh My Zsh unattended install ---
export RUNZSH=no
export CHSH=no
export KEEP_ZSHRC=yes

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --- Set zsh as default shell ---
ZSH_PATH="$(command -v zsh)"
sudo chsh -s "$ZSH_PATH" "$USER_NAME"

# --- Oh My Zsh custom paths ---
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}"

# --- Install Powerlevel10k theme ---
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# --- Install fast-syntax-highlighting plugin ---
if [ ! -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]; then
  git clone --depth=1 \
    https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
    "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
fi

yay -Syu

# --- Firewall ---
sudo systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

echo "Post installation scripts finished. Rebooting..."

sleep 3
sudo reboot

