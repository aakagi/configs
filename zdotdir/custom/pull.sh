#!/usr/bin/env zsh

# Pull private zsh configs from 1Password.
# These are gitignored (__* prefix) and stored as 1Password documents.

CUSTOM_DIR=$(realpath "$(dirname "$0")")

docs=("__akagi.zsh" "__highbeam.zsh" "__archive.zsh")

for doc in "${docs[@]}"; do
  op document get "$doc" --vault="Personal" --out-file="$CUSTOM_DIR/$doc" --force
  echo "→ $doc"
done
