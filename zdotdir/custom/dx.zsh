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

# Disable Power Chime (I don't think this works anymore, need to double check)
alias kp="defaults write com.apple.PowerChime ChimeOnNoHardware -bool true && killall PowerChime"

# Aliases for reloading and editing zsh.
alias zr="zsh -l"
alias ze="code $ZDOTDIR"
