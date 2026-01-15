#!/bin/sh

FOLDER_PATH="$HOME/dotfiles"
CACHE_PATH="$HOME/.cache"
VERSION="$HOME/dotfiles/version"

cd "$HOME"

if [ -d "$FOLDER_PATH" ]; then
  echo "Dotfiles folder exists"
  cd "$CACHE_PATH"
  curl -L -o version https://raw.githubusercontent.com/RaiderDude100/dotfiles/main/version
  function update {-
    if diff "$VERSION" "$CACHE_PATH/version"; then
      echo "Up to date"
    else
      echo "Downloading update"
      git clone https://github.com/RaiderDude100/dotfiles.git 
      mv dotfiles .dotfiles_backup_pre$(cat "$CACHE_PATH/version")
      mv "$CACHE_PATH/dotfiles" "$FOLDER_PATH"
      cd "$FOLDER_PATH"
      stow --override=".*" btop fastfetch gamemode gtk-2 gtk-3 gtk-4 hypr kitty matugen nwg-look qt5ct qt6ct rofi swaync vim wallust waybar zed zsh wallpaper waypaper
    fi
  }
  if [ ! -f "$VERSION" ]; then
    touch "$VERSION"
    update
  else
    update
  fi
else
  echo "Downloading from GitHub"
  git clone https://github.com/RaiderDude100/dotfiles.git
  cd "$FOLDER_PATH/Scripts"
  ./install.sh
fi

echo "Please restart for effects to take place"
exit 0
