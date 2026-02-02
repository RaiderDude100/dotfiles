#!/bin/sh
set -e

USER_NAME="$(whoami)"
HOME_DIR="$HOME"

# --- System setup ---
sudo usermod -aG gamemode "$USER_NAME"
sudo auto-cpufreq --install
sudo reflector --latest 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist

# --- Desktop theming ---
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.interface icon-theme "kora"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"
gsettings set org.gnome.desktop.wm.preferences button-layout ''

waypaper --random

# --- Firewall ---
sudo systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

yay -Syu

tldr --update

cd "$HOME/dotfiles"
touch installed

sudo chsh $USER_NAME -s /usr/bin/fish

echo "Post installation scripts finished. Rebooting..."

sleep 3
sudo reboot

