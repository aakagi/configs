#!/usr/bin/env zsh

THIS_PATH=$(realpath "$0")
ZDOTDIR=$(realpath "$THIS_PATH/..")

echo "→ Set ZDOTDIR to $ZDOTDIR"

# Replace `~/.zshenv` with a single line which sets this directory to be the zsh directory.
echo export ZDOTDIR=$ZDOTDIR >~/.zshenv

# Restart shell with login to load `.zprofile`.
zsh -l
