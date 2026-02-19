#!/usr/bin/env zsh

VSCODE_DIR=$(realpath "$(dirname "$0")")
TARGET_DIR="$HOME/Library/Application Support/Code/User"

mkdir -p "$TARGET_DIR"

for file in settings.json keybindings.json; do
  ln -si "$VSCODE_DIR/$file" "$TARGET_DIR/$file"
done
