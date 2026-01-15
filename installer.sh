#!/bin/sh

FOLDER_PATH="$HOME/dotfiles"
cd "$HOME"

if [ -d "$FOLDER_PATH" ]; then
  echo "Dotfiles exist, checking for updates..."
  cd "$FOLDER_PATH"
  if [ -f "update.sh" ]; then
    echo "Running updater script..."
    ./update.sh
  else
    echo "No updater script found, proceeding with install..."
    cd "$HOME/$FOLDER_PATH/Scripts"
    ./install.sh
  fi
else
  echo "Downloading from GitHub"
  git clone https://github.com/RaiderDude100/dotfiles.git
  cd "$FOLDER_PATH/Scripts"
  ./install.sh
fi

echo "Please restart for effects to take place"
exit 0
