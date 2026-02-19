#!/usr/bin/env zsh

# Pull private zsh configs from 1Password.
# These are gitignored (__* prefix) and stored as 1Password documents.

if ! command -v op &>/dev/null; then
  echo "1Password CLI (op) not found."
  read -q "?Install via Homebrew? [y/n] " && echo && brew install --cask 1password-cli || return 1
fi

CUSTOM_DIR=$(realpath "$(dirname "$0")")

docs=("__akagi.zsh" "__highbeam.zsh" "__archive.zsh")

for doc in "${docs[@]}"; do
  op document get "$doc" --vault="Personal" --out-file="$CUSTOM_DIR/$doc" --force
  echo "→ $doc"
done
