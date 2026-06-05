#!/bin/sh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install com.github.tchx84.Flatseal -y
flatpak install org.gtk.Gtk3theme.adw-gtk3-dark -y
flatpak install org.vinegarhq.Sober -y

sudo flatpak override --filesystem=xdg-config/gtk-3.0:ro
sudo flatpak override --filesystem=xdg-config/gtk-4.0:ro

echo "Flapak setup complete"
exit 0
