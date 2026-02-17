## Misc path aliases
add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
add_path /opt/homebrew/opt/postgresql@13/bin


##############################
## configs (this repo)
##############################

export CONFIGS=$(realpath "$ZDOTDIR/..")

# Makes it easy to "cd" into the dir just by typing `$configs`.
export configs=$CONFIGS

alias configs="code $CONFIGS"

##############################
## DX Aliases
##############################

# Open current directory in finder
alias o="open ."

# vscode
alias c="code ."

# Automatically make `mv` safe and verbose
alias mv='mv -vn'

# Run `tree` command for active & maintained projects
alias lsproj="tree -d -L 2 -I 'archive|$sandbox_dirname' $proj"

# Aliases for reloading and editing zsh.
alias zr="zsh -l"
alias ze="code $ZDOTDIR"

## Justfile
alias j="just"

## Shell startup benchmark
alias zsh_bench='for i in $(seq 1 5); do /usr/bin/time zsh -ilc exit 2>&1; done'
