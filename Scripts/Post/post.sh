#!/bin/sh
set -e

USER_NAME="$(whoami)"

# --- System setup ---
sudo usermod -aG gamemode "$USER_NAME"
sudo auto-cpufreq --install
sudo reflector --latest 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist

# --- Desktop theming ---
ln -sf $HOME/dotfiles/gtk-4/default/gtk-4.0/ $HOME/.config/
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
gsettings set org.gnome.desktop.interface cursor-theme "WhiteSur-cursors"
gsettings set org.gnome.desktop.interface font-name "Space Mono Nerd Font 13.7"
gsettings set org.gnome.desktop.wm.preferences button-layout ''

waypaper --random

# --- Firewall ---
sudo systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

yay -Syu --noconfirm

tldr --update

cd "$HOME/dotfiles"
touch installed

echo "Choose shell"
echo "1 for zsh"
echo "2 for fish"
read -rp "Enter your choice: " choice_shell

if [ $choice_shell == "1" ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
elif [ $choice_shell == "2" ] ; then
    sudo chsh $USER_NAME -s /usr/bin/fish
fi


echo "Do you want to install Cloudflare warp? (recommended)"
read -rp "Enter yes to install: " choice_warp

if [ $choice_shell == "yes" || $choice_shell == "YES" || $choice_shell == "Yes" ]; then
    sudo systemctl enable --now warp-svc.service
    warp-cli registration new
    warp-cli connect
fi

echo "Post installation scripts finished. Rebooting..."

sleep 3
sudo reboot

