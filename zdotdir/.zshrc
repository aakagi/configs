#!/usr/bin/env zsh

###################################################################################################
# -- .zshrc --
# Typically reserved for things that are not inheritable by subshells
# aliases, functions, custom prompts, history customizations, etc.
###################################################################################################

##############################
# -- configs (this repo) --
##############################

export CONFIGS=$(realpath "$ZDOTDIR/..")

alias configs="code $CONFIGS"

##############################
# -- oh-my-zsh --
##############################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to custom oh-my-zsh plugins.
export ZSH_CUSTOM="$ZDOTDIR/custom"

# Set zsh theme.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git        # git shortcuts
  globalias  # expand aliases
  poetry     # [python] poetry completions
  virtualenv # [python] sets $VIRTUAL_ENV and shows in theme

  # ... custom plugins
  akagi    # my personal preferences & aliases
  highbeam # my highbeam preferences & aliases
)

# Aliases for reloading and editing zsh.
alias zr="zsh -l"
alias ze="code $ZDOTDIR"

##############################
# -- homebrew --
##############################

# Add `brew` to path.
eval "$(/opt/homebrew/bin/brew shellenv)"

#######################################################################################
# -- Load `oh-my-zsh` --
source $ZSH/oh-my-zsh.sh
# This should always go last!
# zsh files in `zdotdir/custom` should load next, in alphabetical order.
# END: Remove anything below here and re-organize it, it was likely added by a script.
#######################################################################################
