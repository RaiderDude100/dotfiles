#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

CHAOTIC_KEY_ID="3056513887B78AEB"
PACMAN_CONF="/etc/pacman.conf"
REPO_NAME="chaotic-aur"
REPO_HEADER="[$REPO_NAME]"
MIRRORLIST="/etc/pacman.d/chaotic-mirrorlist"

echo -e "${GREEN}==> Setting up Chaotic AUR${NC}"

if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}Must be run as root${NC}" >&2
  exit 1
fi

echo -e "${GREEN}==> Ensuring Chaotic AUR key${NC}"
if ! pacman-key --list-keys "$CHAOTIC_KEY_ID" &>/dev/null; then
  pacman-key --recv-key "$CHAOTIC_KEY_ID" --keyserver keyserver.ubuntu.com
  pacman-key --lsign-key "$CHAOTIC_KEY_ID"
fi

echo -e "${GREEN}==> Ensuring Chaotic AUR packages${NC}"
pacman -U --noconfirm --needed \
  https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst \
  https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst

echo -e "${GREEN}==> Ensuring pacman.conf entry${NC}"
if ! grep -q "^\[$REPO_NAME\]" "$PACMAN_CONF"; then
  printf "\n[%s]\nInclude = %s\n" "$REPO_NAME" "$MIRRORLIST" >> "$PACMAN_CONF"
fi

echo -e "${GREEN}==> Syncing package databases${NC}"
sudo pacman -Sy --noconfirm

echo -e "${GREEN}==> Chaotic AUR ready${NC}"

